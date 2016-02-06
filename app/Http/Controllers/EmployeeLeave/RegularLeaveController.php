<?php

namespace DNSCHumanResource\Http\Controllers\EmployeeLeave;

use DNSCHumanResource\Events\RegularLeaveApproved;
use DNSCHumanResource\Events\RegularLeaveRejected;
use DNSCHumanResource\FormWriters\WriteRegularLeaveForm;
use DNSCHumanResource\FormWriters\WriteRegularLeaveSummary;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\HumanResource\Contracts\RegularLeave;
use DNSCHumanResource\HumanResource\Services\RegularLeaveService;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;
use Validator;

class RegularLeaveController extends Controller
{

    /**
     * @var mixed
     */
    protected $user;

    protected $regularLeave;

    protected $leaveService;

    public function __construct(RegularLeave $regularLeave, RegularLeaveService $leaveService)
    {
        $this->user = auth()->user();
        $this->regularLeave = $regularLeave;
        $this->leaveService = $leaveService;
    }

    public function index()
    {
        $employee = auth()->user()->employee;

        if ($employee->canApproveRegularLeave()) {
            if ($employee->user->isAdmin()) {
                $employee_leaves = EmployeeLeave::approved()->get();
            } else {
                $employee_leaves = $employee->regular_leave_recommending_approvals->merge($employee->regular_leave_approved_by);
            }
            return view('leaves.regular.employee_leaves')->with(compact('employee_leaves'));
        }
        abort(403);
    }

    public function downloadSummary()
    {
        $leaves = EmployeeLeave::certified()->get();

        if ($leaves->isEmpty()) {
            flash()->warning('No regular leave filed.');
            return redirect()->back();
        }

        write_form(new WriteRegularLeaveSummary($leaves));
    }

    public function downloadSummaryPerEmployee(Employee $employee)
    {
        $leaves = $employee->employee_leaves()->certified()->orderBy('start_date', 'desc')->get();
        if ($leaves->isEmpty()) {
            flash()->warning('Employee has no regular leave yet.');
            return redirect()->back();
        }
        write_form(new \DNSCHumanResource\FormWriters\WriteEmployeeRegularLeaveSummary($leaves));
    }

    public function create()
    {
        if ($this->user->can('create', new EmployeeLeave)) {
            $employee = $this->user->employee;
            $approvals = collect();
            $approvals->push($employee->approval_heirarchy->recommending_approval);
            $approvals->push($employee->approval_heirarchy->approved_by);
            $approvals->push(getAdmin()->employee);
            return view('leaves.regular.apply')->with(compact('employee', 'approvals'));
        }
        flash()->error('Ooopps! Your are not allowed to apply a regular leave.');
        return redirect()->back();
    }

    /**
     * @param $id
     */
    public function show(Request $request, $id)
    {
        $leave = $this->regularLeave->get($id);
        if ($request->user()->can('show', $leave)) {
            $approvals = collect();
            $approvals->push($leave->recommending_approval);
            $approvals->push($leave->approved_by);
            $approvals->push($leave->certified_by);
            return view('leaves.regular.view')->with(compact('leave', 'approvals'));
        }
        flash()->error('You are not allowed to view this leave.');
        return redirect()->back();
    }

    /**
     * @param Request $request
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all());

        if ($request->user()->can('create', new EmployeeLeave)) {
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $employee = $request->user()->employee;
            $approvals = $employee->approval_heirarchy;

            $leave = $request->all();
            // Add recommending approval or set status to recommended
            $leave = $approvals->recommending_approval ? array_add($leave, 'recommending_approval_id', $approvals->recommending_approval->id) : array_add($leave, 'status', 'recommended');

            $leave = array_add($leave, 'approved_by_id',
                $approvals->approved_by ? $approvals->approved_by->id : null);

            $leave = array_add($leave, 'certified_by_id', getAdmin()->employee->id);

            $leave = new EmployeeLeave($leave);

            if ($request->user()->can('store', $leave)) {
                $leave = $employee->employee_leaves()->save($leave);

                flash()->success('Your leave application is sent. Please wait for confirmation');
                return redirect()->to('/leave/personal');
            }
            flash()->warning('You are already out of credits!');
            return redirect()->back();
        }
        flash()->error('Oopps! You are trying to breach our security!');
        return redirect()->to('/');
    }

    public function edit($id)
    {
        $leave = EmployeeLeave::findOrFail($id);
        $this->authorize('edit', $leave);
        $employee = $leave->employee;
        $approvals = collect();
        $approvals->push($leave->recommending_approval);
        $approvals->push($leave->approved_by);
        $approvals->push($leave->certified_by);
        return view('leaves.regular.apply')->with(compact('employee', 'approvals', 'leave'));
    }

    public function update(Request $request, $id)
    {
        // Find the leave request by id
        $leave = EmployeeLeave::findOrFail($id);
        // check if the auth user is authorize to update this leave
        $this->authorize('edit', $leave);
        // update the leave request
        $data = $request->all();

        $data = array_add($data, 'file', null);

        $leave->update($data);

        write_form(new WriteRegularLeaveForm($leave));

        flash()->success('Leave request was updated!');
        return redirect()->to('/leave/personal');
    }

    /**
     * @param Request $request
     * @param $id
     */
    public function approve(Request $request, $id)
    {
        $leave = $this->regularLeave->get($id);
        if ($leave) {
            $this->authorize('approve', $leave);

            $leave = $this->leaveService->approve($leave);

            event(new RegularLeaveApproved($leave));

            return response()->json(['success' => true], 200);
        }
        return response()->json(['success' => false], 404);
    }

    /**
     * @param Request $request
     * @param $id
     */
    public function reject(Request $request, $id)
    {
        $leave = $this->regularLeave->get($id);
        if ($leave) {
            // Check if the authenticated user is authorize to reject this leave
            $this->authorize('approve', $leave);
            // Perform reject logic
            $leave = $this->leaveService->reject($request, $leave);

            event(new RegularLeaveRejected($leave));

            return response()->json('Leave rejected!', 200);
        }
        return response('Leave not found!', 404);
    }

    /**
     * @param $id
     */
    public function preview($id)
    {
        $leave = $this->regularLeave->get($id);
        if ($leave) {
            $path = 'files/RegularLeaveForms/' . $leave->file;
            return redirect()->to(viewDocumentOnline(url($path)));
        }
    }

    /**
     * @param $id
     */
    public function download($id)
    {
        $leave = $this->regularLeave->get($id);
        return response()->download('files/RegularLeaveForms/' . $leave->file);
    }

    public function destroy($id)
    {
        $leave = EmployeeLeave::findOrFail($id);
        $this->authorize('cancel', $leave);
        $leave->delete();
        return response()->json(['success' => true], 200);
    }

    protected function validator($data)
    {
        return Validator::make($data, [
            'working_days_applied' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'commutation' => 'required',
            'leave_type' => 'required',
            'additional_info' => 'required',
        ]);
    }

}

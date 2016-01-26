<?php

namespace DNSCHumanResource\Http\Controllers\EmployeeLeave;

use DNSCHumanResource\Events\SpecialLeaveApproved;
use DNSCHumanResource\Events\SpecialLeaveRejected;
use DNSCHumanResource\FormWriters\WriteSpecialLeaveForm;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\HumanResource\Repositories\SpecialLeaveRepository;
use DNSCHumanResource\HumanResource\Services\SpecialLeaveService;
use DNSCHumanResource\Models\EmployeeSpecialLeave;
use DNSCHumanResource\Models\User;
use Gate;
use Illuminate\Http\Request;
use Validator;

class SpecialLeaveController extends Controller
{

    /**
     * @var Auth
     */
    public $user;

    /**
     * @var EmployeeSpecialLeave
     */
    protected $leave;

    /**
     * @var mixed
     */
    protected $specialLeaveService;

    /**
     * Inject all the required dependencies
     *
     * @param SpecialLeaveRepository $leave
     * @param SpecialLeaveService $specialLeaveService
     */
    public function __construct(SpecialLeaveRepository $leave, SpecialLeaveService $specialLeaveService)
    {
        $this->user                = auth()->user();
        $this->leave               = $leave;
        $this->specialLeaveService = $specialLeaveService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */

    public function index()
    {
        if ($this->user->employee->canApproveSpecialLeave()) {
            if ($this->user->isAdmin()) {
                $employee_leaves = EmployeeSpecialLeave::approved()->get();
            } else {
                $employee_leaves = $this->user->employee->special_leave_recommending_approvals->merge($this->user->employee->special_leave_approved_by);
            }
            return view('leaves.special.employee_leaves')->with(compact('employee_leaves'));
        }
        abort(403);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $employee = $this->user->employee;
        if (Gate::allows('create', new EmployeeSpecialLeave)) {
            $approvals = collect();
            $approvals->push($employee->approval_heirarchy->recommending_approval);
            $approvals->push($employee->approval_heirarchy->approved_by);
            $approvals->push(getAdmin()->employee);
            return view('leaves.special.apply')->with(compact('employee', 'approvals'));
        }
        flash()->error('You are not allowed to filed a special leave request!');
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        if ($this->validator($request->all())->fails()) {
            flash()->error('Please fill the missing fields.');
            return redirect()->back()->withInput();
        } else {
            $approvals = $request->user()->employee->approval_heirarchy;

            $leave = $request->all();

            if ($approvals->recommending_approval) {
                $leave = array_add($leave, 'recommending_approval_id', $approvals->recommending_approval->id);
            } else {
                $leave = array_add($leave, 'status', 'recommended');
            }

            $leave = array_add($leave, 'approved_by_id',
                $approvals->approved_by ? $approvals->approved_by->id : null);

            $leave = array_add($leave, 'certified_by_id', getAdmin()->employee->id);

            $leave = new EmployeeSpecialLeave($leave);

            if (Gate::allows('store', $leave)) {
                $leave = $this->user->employee->employee_special_leaves()->save($leave);
                if ($leave) {
                    write_form(new WriteSpecialLeaveForm($leave));
                    flash()->success('Leave request sent. Please wait for the confirmation.');
                    return redirect()->to('/leave/personal');
                }
            }
            flash()->error('An unknown error occured!.');
            return redirect()->to('/dashboard');
        }
    }

    public function edit($id)
    {
        $leave = EmployeeSpecialLeave::findOrFail($id);
        $this->authorize('edit', $leave);
        $approvals = collect();
        $employee  = $leave->employee;
        $approvals->push($leave->recommending_approval);
        $approvals->push($leave->approved_by);
        $approvals->push($leave->certified_by);
        return view('leaves.special.apply')->with(compact('employee', 'leave', 'approvals'));
    }

    public function update(Request $request, $id)
    {
        $leave = EmployeeSpecialLeave::findOrFail($id);
        $this->authorize('edit', $leave);
        $leave = $leave->update($request->all());
        if ($leave) {
            flash()->success('Special leave updated!');
            return redirect()->to('/leave/personal');
        }
        flash()->error('Special leave not updated!');
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $leave     = EmployeeSpecialLeave::with('employee.user')->findOrFail($id);
        $approvals = collect();
        $approvals->push($leave->recommending_approval);
        $approvals->push($leave->approved_by);
        $approvals->push($leave->certified_by);
        return view('leaves.special.view')->with(compact('leave', 'approvals'));
    }

    /**
     * @param $id
     */
    public function approve(Request $request, $id)
    {
        $leave = EmployeeSpecialLeave::findOrFail($id);

        if ($request->user()->can('approve', $leave)) {
            $leave = $this->specialLeaveService->approve($leave);
            event(new SpecialLeaveApproved($leave));
            write_form(new WriteSpecialLeaveForm($leave));
            return response()->json('Special leave request approved!', 200);
        }
        return response()->json('Unathorized access.', 401);
    }

    /**
     * @param Request $request
     * @param $id
     */
    public function reject(Request $request, $id)
    {
        $leave = EmployeeSpecialLeave::findOrFail($id);

        $leave = $this->specialLeaveService->reject($leave);

        event(new SpecialLeaveRejected($leave));

        return response()->json('Special leave rejected!', 200);
    }

    public function destroy($id)
    {
        $leave = EmployeeSpecialLeave::findOrFail($id);
        $this->authorize('cancel', $leave);
        $leave->delete();
        flash()->success(trans('messages.special-leave-cancelled'));
        return response()->json(['success' => true]);
    }

    /**
     * @param $id
     */
    public function preview($id)
    {
        $leave = EmployeeSpecialLeave::find($id);
        if ($leave) {
            $path = 'files/SpecialLeaveForms/' . $leave->file;
            return redirect()->to(viewDocumentOnline(url($path)));
        }
    }

    /**
     * @param $id
     */
    public function download($id)
    {
        $leave = EmployeeSpecialLeave::find($id);
        if (!file_exists('files/SpecialLeaveForms/' . $leave->file) or null === $leave->file) {
            write_form(new WriteSpecialLeaveForm($leave));
        }
        return response()->download('files/SpecialLeaveForms/' . $leave->file);
    }

    public function downloadSummary()
    {
        $file = storage_path('app/templates/SpecialLeaveSummary.xlsx');

        $leaves = EmployeeSpecialLeave::certified()->get();

        if ($leaves->isEmpty()) {
            flash()->warning('Special leave empty.');
            return redirect()->back();
        }

        write_form(new \DNSCHumanResource\FormWriters\WriteSpecialLeaveSummary($leaves));
    }

    /**
     * Validates the user special leave request
     *
     * @param $data
     */
    protected function validator($data)
    {
        return Validator::make($data, [
            'type'      => 'required',
            'date_from' => 'required',
            'date_to'   => 'required',
        ]);
    }
}

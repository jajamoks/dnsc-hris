<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Events\TravelOrderApproved;
use DNSCHumanResource\Events\TravelOrderRejected;
use DNSCHumanResource\FormWriters\WriteTravelOrderForm;
use DNSCHumanResource\FormWriters\WriteTravelOrderSummary;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\TravelOrder;
use DNSCHumanResource\Models\User;
use DNSCHumanResource\Services\TravelOrderService;
use Illuminate\Http\Request;
use Validator;

class TravelController extends Controller
{

    protected $user;

    protected $travelService;

    public function __construct(TravelOrderService $travel)
    {
        $this->user = auth()->user();

        $this->travelService = $travel;
    }

    public function approve($id)
    {
        $travel = TravelOrder::findOrFail($id);

        $travel = $this->travelService->approve($travel);

        event(new TravelOrderApproved($travel));
        return response()->json('Travel order approved', 200);
    }

    public function approved()
    {
        $travels = TravelOrder::certified()->get();
        return view('travel-order.approved')->with(compact('travels'));
    }

    public function approves(Request $request)
    {
        if ($request->user()->employee && $request->user()->employee->canApproveTravelOrder()) {
            if ($request->user()->isFinanceDirector()) {
                $travels = TravelOrder::recommended()->get();
            } else {
                $travels = $request->user()->employee->travel_order_recommending_approvals->merge($request->user()->employee->travel_order_approved_by);
            }
            return view('travel-order.requested')->with(compact('travels'));
        }
        abort(401);
    }

    public function create(Request $request)
    {
        if ($request->user()->can('create', new TravelOrder)) {
            $heirarchy = $this->user->employee->approval_heirarchy;
            $approvals = collect();
            if (!$request->user()->isFinanceDirector()) {
                if (!$heirarchy->approved_by->user->isPresident()) {
                    $approvals->push($heirarchy->approved_by);
                }
                $approvals->push(getFinanceDirector());
            }
            $approvals->push(getPresident());
            return view('travel-order.apply')->with(compact('approvals'));
        }
        flash()->error('You are not allowed to file a travel order!');
        return redirect()->back();
    }

    public function download($id)
    {
        $travel = TravelOrder::findOrFail($id);
        return response()->download($travel->file_path);
    }

    public function index()
    {
        $travels = TravelOrder::where('employee_id', auth()->user()->employee->id)->get();
        return view('travel-order.my_travel')->with(compact('travels'));
    }

    public function reject(Request $request, $id)
    {
        $travel = TravelOrder::findOrFail($id);

        if ($request->user()->can('approve', $travel)) {
            $this->travelService->reject($travel);
            event(new TravelOrderRejected($travel));
            return response()->json('Travel order rejected', 200);
        }
        abort(401);
    }

    public function show($id)
    {
        $travel = TravelOrder::findOrFail($id);
        $approvals = collect();
        $approvals->push($travel->recommending_approval);
        $approvals->push($travel->finance_director);
        $approvals->push($travel->approved_by);
        return view('travel-order.view')->with(compact('travel', 'approvals'));
    }

    public function store(Request $request)
    {
        if ($request->user()->can('create', new TravelOrder)) {
            $validator = $this->validator($request->all());
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            } else {
                $approvals = $request->user()->employee->approval_heirarchy;

                $travel = $request->all();

                if ($request->user()->isFinanceDirector()) {
                    $travel = array_add($travel, 'status', 'approved');
                } else {
                    if ($approvals->approved_by && !$approvals->approved_by->user->isPresident()) {
                        $travel = array_add($travel, 'recommending_approval_id', $approvals->approved_by->id);
                    } else {
                        $travel = array_add($travel, 'status', 'recommended');
                    }

                    $travel = array_add($travel, 'finance_director_id', getFinanceDirector()->id);
                }

                $travel = array_add($travel, 'approved_by_id', getPresident()->id);

                $travel = auth()->user()->employee->travel_orders()->save(new TravelOrder($travel));

                write_form(new WriteTravelOrderForm($travel));

                flash()->success('Travel order sent. Please wait for your approvals.');

                return redirect()->to('/travel');
            }
        }
        abort(401);
    }

    // public function destroy($id)
    // {
    //     $travel = TravelOrder::findOrFail($id);
    //     $this->authorize('cancel', $travel);
    //     $travel->delete();
    //     return response()->json(['success' => true]);
    // }

    public function summary(Request $request)
    {
        $travels = TravelOrder::certified()->orderBy('travel_order_number')->get();

        if ($request->user()->isAdmin()) {
            write_form(new WriteTravelOrderSummary($travels));
        }
        abort(401);
    }

    public function downloadSummaryPerEmployee(Request $request, Employee $employee)
    {
        $travels = $employee->travel_orders()->certified()->get();
        if ($travels->isEmpty()) {
            flash()->warning('You have no certified travel orders yet.');
            return redirect()->back();
        }
        write_form(new \DNSCHumanResource\FormWriters\WriteEmployeeTravelOrderSummary($travels));
    }

    public function employeeSummary(Request $request, User $user)
    {
        $employee = $user->employee;
        if ($employee) {
            $travels = $employee->travel_orders()->certified()->get();
            if ($travels->isEmpty()) {
                flash()->warning('This employee has no travel orders listed.');
                return redirect()->back();
            }
            write_form(new WriteTravelOrderSummary($travels));
        }
    }

    protected function validator($data)
    {
        return Validator::make($data, [
            'recipient' => 'required',
            'destination' => 'required',
            'purpose' => 'required',
            'date_from' => 'required',
            'date_to' => 'required',
        ]);
    }
}

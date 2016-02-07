<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\Training;
use Illuminate\Http\Request;

class CalendarController extends Controller
{

    public $authUser;

    public function __construct()
    {
        $this->authUser = auth()->user();
    }

    public function index()
    {
        if ($this->authUser->isAdmin()) {
            $events = Training::all();
        } else {
            $events = $this->authUser->employee->trainings;
        }
        return response()->json($events, 200);
    }

    public function show($id)
    {
        $training = Training::whereId($id)->with('employees.user')->firstOrFail();

        $employees = Employee::all()->map(function ($value) {
            return [
                'value' => $value->id,
                'text' => $value->full_name,
            ];
        });

        $participants = $training->employees->keyBy('id')->keys();

        return response()->json(compact('training', 'employees', 'participants'), 200);
    }

    public function update(Request $request, $id)
    {
        $training = Training::with('employees.user')->findOrFail($id);

        $training->update($request->training);

        $training->employees()->sync($request->participants);

        return response()->json($training, 200);
    }

    public function toggleIncludeInPds(Request $request, $id)
    {
        $training = $this->authUser->employee->trainings()->findOrFail($id);

        $training->pivot->update([
            'include_in_pds' => $training->pivot->include_in_pds === 1 ? 0 : 1,
        ]);

        return $training;
    }

    public function getInvitations()
    {
        $employee = $this->authUser->employee;
        if ($employee) {
            $paginator = $employee->trainings()->unfinished()->paginate(10)->jsonSerialize();
            return response()->json($paginator, 200);
        }
    }

    public function rvsp(Request $request, $id)
    {
        $training = $this->authUser->employee->trainings()->find($id);
        $training->pivot->update($request->all());
        return $training;
    }

    public function destroy($id)
    {
        $training = Training::findOrFail($id)->delete();

        return response()->json('Deleted!', 200);
    }

}

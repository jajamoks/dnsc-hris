<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Department;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\Training;
use DNSCHumanResource\Models\TrainingParticipant;
use DNSCHumanResource\Models\User;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Validator;

class CalendarController extends Controller
{

    public function download()
    {
        $events = Training::orderBy('start')->get();
        write_form(new \DNSCHumanResource\FormWriters\WriteTrainingsAndSeminarSummary($events));
    }

    /*
     * Custom calendar functions
     */

    /**
     * @param Request $request
     * @param User $user
     */
    public function employeeTrainings(Request $request, User $user)
    {
        $employee = $user->employee;
        if ($request->wantsJson() && $employee) {
            return $employee->trainings;
        }
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function index(Request $request)
    {
        $departments = Department::all();

        $employees = Employee::all();

        $events = Training::with('employees')->get();

        return view('events.calendar')->with(compact('departments', 'employees', 'events'));
    }

    /**
     * @param Request $request
     * @param $training_id
     */
    public function show(Request $request, $training_id)
    {
        $training = Training::with('employees.user')->where('id', $training_id)->first();

        return view('events.show')->with(compact('training'));
    }

    /**
     * @param Request $request
     */
    public function store(Request $request)
    {
        if ($this->validator($request->all())->fails()) {
            flash()->error('You have missing fields.');
            return redirect()->back();
        }

        $training = Training::create($request->all());

        if ($training) {
            if (is_array($request->participants)) {
                foreach ($request->input('participants') as $participant) {
                    try {
                        if ($participant == 'all') {
                            foreach (Employee::all() as $employee) {
                                TrainingParticipant::create(['training_id' => $training->id, 'employee_id' => $employee->id]);
                                // $training->employees()->attach($employee->id);
                            }
                            break;
                        } elseif (is_object(json_decode($participant))) {
                            $participant = json_decode($participant);
                            foreach (Department::find($participant->id)->users as $user) {
                                TrainingParticipant::create(['training_id' => $training->id, 'employee_id' => $user->employee->id]);
                                // $training->employees()->attach($user->employee->id);
                            }
                        } else {
                            TrainingParticipant::create(['training_id' => $training->id, 'employee_id' => $participant]);
                            // $training->employees()->attach($participant);
                        }
                    } catch (QueryException $ex) {

                    }
                }
            }
            flash()->success('Successfully added the trainings and seminar.');
        } else {
            flash()->error('Oopss! Something went wrong.');
        }
        return redirect()->back();
    }

    /**
     * @param $data
     */
    protected function validator($data)
    {
        return Validator::make($data, [
            'title'       => 'required',
            'description' => 'required',
            'venue'       => 'required',
            'start'       => 'required',
            'end'         => 'required',
        ]);
    }
}

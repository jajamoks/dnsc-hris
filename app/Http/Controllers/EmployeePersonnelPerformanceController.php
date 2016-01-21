<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;

class EmployeePersonnelPerformanceController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);
        if ($employee) {
            $rating = $employee->personnel_performance;
            if ($rating) {
                $this->update($request, $rating);
            } else {
                $employee->personnel_performance()->create($request->all());
            }
            return response($employee->personnel_performance, 200);
        }
        return response('Error occured!', 500);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, User $user)
    {
        $employee = $user->employee;
        if ($request->wantsJson() && $employee) {
            $rating = $employee->personnel_performance;
            $qce    = $employee->employee_qce;
            return response()->json(compact('rating', 'qce'), 200);
            // return response()->view('personnel-performance.show', compact('employee', 'rating', 'qce'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $rating)
    {
        $rating->strategic_function = $request->strategic_function;
        $rating->core_function      = $request->core_function;
        if ($rating->save()) {
            return true;
        }
    }
}

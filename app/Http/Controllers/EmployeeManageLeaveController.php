<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use Illuminate\Http\Request;

class EmployeeManageLeaveController extends Controller
{

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);

        $leaveCredits = $employee->leave_credit()->update($request->leave_credit);

        $accumulatedLeaves = $employee->accumulated_leave()->update($request->accumulated_leave);

        return response()->json([
            'leave_credit'      => $employee->leave_credit,
            'accumulated_leave' => $employee->accumulated_leave,
        ], 200);
    }

}

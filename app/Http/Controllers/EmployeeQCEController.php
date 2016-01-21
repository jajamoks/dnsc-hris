<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\EmployeeQCE;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;

class EmployeeQCEController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, User $user)
    {
        $employee = $user->employee;
        if ($employee) {
            $qce = $employee->employee_qce;
            if (!$this->isTotalOneHundredBelow($request->all())) {
                return response('Employee QCE cannot exceed 100!', 500);
            }
            if ($qce) {
                $qce->update($request->all());
            } else {
                $employee->employee_qce()->create($request->all());
            }
            return response()->json($employee->employee_qce, 200);
        } else {
            return response('Employee has no personal data sheet!', 200);
        }
    }

    protected function isTotalOneHundredBelow($data)
    {
        $qce = new EmployeeQCE($data);
        if ($qce->total() > 100) {
            return false;
        }
        return true;
    }
}

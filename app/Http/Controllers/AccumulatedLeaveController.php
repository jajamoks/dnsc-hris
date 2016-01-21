<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;

class AccumulatedLeaveController extends Controller
{

    public function store(Request $request, User $user)
    {
        $employee = $user->employee;
        if ($employee) {
            $employee->accumulated_leave()->create($request->all());
            return $employee->accumulated_leave;
        }
    }

}

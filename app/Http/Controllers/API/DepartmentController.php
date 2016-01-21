<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Department;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{

    public function show(Request $request, $code)
    {
        $department = Department::whereCode($code)->with('employees.user')->firstOrFail();
        return $department;
    }

}

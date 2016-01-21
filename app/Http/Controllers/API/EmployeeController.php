<?php

namespace DNSCHumanResource\Http\Controllers\API;

use Carbon\Carbon;
use DNSCHumanResource\Events\EmployeeUtilityUpdated;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{

    public function getAllEmployees()
    {
        $users = User::with('employee.employee_qce',
            'employee.personnel_performance',
            'department',
            'positions',
            'employee.leave_credit',
            'employee.accumulated_leave',
            'employee.approval_heirarchy',
            'employee.utility')->get();
        return response()->json($users);
    }

    public function recentEmployees()
    {
        $employees = Employee::with('user')->orderBy('updated_at', 'desc')->paginate(15);

        return response()->json($employees, 200);
    }

    public function updateEmployeeUtility(Request $request, Employee $employee)
    {
        $utility = $employee->utility;

        $utility->can_file_vacation_leave = $request->utility['can_file_vacation_leave'];

        $utility->can_file_sick_leave = $request->utility['can_file_sick_leave'];

        $utility->can_file_special_leave = $request->utility['can_file_special_leave'];

        $utility->can_file_travel_order = $request->utility['can_file_travel_order'];

        event(new EmployeeUtilityUpdated($utility));

        return response()->json($utility, 200);
    }

    public function birthdays(Request $request)
    {
        $employees = Employee::whereBirthday(Carbon::today());
        return response()->json($employees, 200);
    }

}

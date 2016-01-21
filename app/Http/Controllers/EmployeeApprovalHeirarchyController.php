<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use Illuminate\Http\Request;

class EmployeeApprovalHeirarchyController extends Controller
{

    public function create(Employee $employee)
    {
        $employees = Employee::all();
        return response()->view('employee.approval-heirarchy.create-modal', compact('employee', 'employees'));
    }

    public function edit(Employee $employee)
    {
        $employees         = Employee::all();
        $approvalHeirarchy = $employee->approval_heirarchy;
        return response()->view('employee.approval-heirarchy.create-modal', compact('employee', 'employees', 'approvalHeirarchy'));
    }

    public function store(Request $request, Employee $employee)
    {
        // dd($request->all());
        if ($request->isMethod('PUT')) {
            $employee->approval_heirarchy->update($this->getApproval($request));
            flash()->success($employee->full_name . ' approval heirarchy was already saved and updated.');
        } else {
            $employee->approval_heirarchy()->create($this->getApproval($request));
            flash()->success($employee->full_name . ' approval heirarchy was already set.');
        }
        return redirect()->back();
    }

    protected function getApproval($request)
    {
        $approvals = [
            'recommending_approval_id' => $request->recommending_approval_id == 'None' ? null : $request->recommending_approval_id,
            'approved_by_id'           => $request->approved_by_id == 'None' ? null : $request->approved_by_id,
        ];
        return $approvals;
    }

}

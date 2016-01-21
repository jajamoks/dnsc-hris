<?php namespace DNSCHumanResource\HumanResource\Repositories;

use DNSCHumanResource\HumanResource\Contracts\RegularLeave;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\EmployeeLeave;
use HumanResource;

class RegularLeaveRepository implements RegularLeave
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    public function get($id)
    {
        return EmployeeLeave::with('employee')->find($id);
    }

    public function approvedLeaves()
    {
        return EmployeeLeave::approved()->with('employee')->get();
    }

    public function approvedVacationLeaves()
    {
        return EmployeeLeave::approved()->vacation()->get();
    }

    public function approvedSickLeaves()
    {
        return EmployeeLeave::approved()->sick()->get();
    }

    public function employeeLeave(Employee $employee)
    {
        return $employee->employee_leaves;
    }

    public function filedLeave(Employee $employee)
    {
        return EmployeeLeave::with('employee')->where('recommending_approval', $employee->id)->filed()->get();
    }

    public function pendingLeave()
    {
        return EmployeeLeave::pending()->with('employee')->get();
    }

    public function myLeave()
    {
        return $this->employeeLeave($this->user->employee);
    }

    public function getRegularLeaveRecommendingApproval()
    {
        if ($this->user->isAdmin() or $this->user->isDepartmentHead()) {
            return HumanResource::president();
        } elseif ($this->user->isPresident()) {
            return null;
        }
        return HumanResource::departmentHead();
    }

    public function getRegularLeaveCertifiedBy()
    {
        if ($this->user->isAdmin() or $this->user->isPresident()) {
            return null;
        } elseif ($this->user->isDepartmentHead() or $this->user->isUser()) {
            return HumanResource::admin();
        }
    }

}

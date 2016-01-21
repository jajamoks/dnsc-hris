<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\User;

class RegularLeavePolicy
{

    public function create(User $user, EmployeeLeave $leave)
    {
        $employee = $user->employee;
        if ($employee->approval_heirarchy && $employee->utility->canFileRegularLeave()) {
            return true;
        }
        return false;
    }

    public function edit(User $user, EmployeeLeave $leave)
    {
        if (($user->employee->id == $leave->employee->id) && $leave->isStatus('filed')) {
            return true;
        }
        return false;
    }

    public function show(User $user, EmployeeLeave $leave)
    {
        $employee = $user->employee;
        if ($user->isAdmin()) {
            return true;
        }
        switch ($employee->id) {
            case $leave->employee->id:
                return true;
                break;
            case $leave->recommending_approval_id:
                return true;
                break;
            case $leave->approved_by_id:
                return true;
                break;
            default:
                return false;
                break;
        }
    }

    public function store(User $user, EmployeeLeave $leave)
    {
        return $this->checkCredits($user->employee, $leave);
    }

    public function approve(User $user, EmployeeLeave $leave)
    {
        $employee = $user->employee;
        if ($this->checkCredits($leave->employee, $leave)) {
            if ($leave->isStatus('filed') && ($leave->recommending_approval->id === $employee->id)) {
                return true;
            } elseif ($leave->isStatus('recommended') && ($leave->approved_by->id === $employee->id)) {
                return true;
            } elseif ($leave->isStatus('approved') && $employee->user->isAdmin()) {
                return true;
            }
        }
        return false;
    }

    public function reject(User $user, EmployeeLeave $leave)
    {
        $employee = $user->employee;
        if ($leave->isStatus('filed') && ($leave->recommending_approval->id === $employee->id)) {
            return true;
        } elseif ($leave->isStatus('recommended') && ($leave->approved_by->id === $employee->id)) {
            return true;
        }
        return false;
    }

    public function cancel(User $user, EmployeeLeave $leave)
    {
        if ($leave->employee->user->id == $user->id) {
            if ($leave->isStatus('filed') or $leave->isStatus('pending')) {
                return true;
            }
        }
    }

    protected function checkCredits($employee, $leave)
    {
        $daysApplied = $leave->working_days_applied;
        if ($leave->isLeaveType('vacation')) {
            return $employee->accumulated_leave->hasAvailableVacationLeaveCredits($daysApplied);
        } elseif ($leave->isLeaveType('sick')) {
            return $employee->accumulated_leave->hasAvailableSickLeaveCredits($daysApplied);
        }
        return true;
    }
}

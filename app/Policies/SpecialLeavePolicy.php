<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\EmployeeSpecialLeave;
use DNSCHumanResource\Models\User;

class SpecialLeavePolicy
{

    public function create(User $user, EmployeeSpecialLeave $leave)
    {
        $employee = $user->employee;
        if ($employee->approval_heirarchy && $employee->utility->can_file_special_leave) {
            return true;
        }
        return false;
    }

    public function show(User $user, EmployeeSpecialLeave $leave)
    {
        if ($leave->isOwner()) {
            return true;
        }
        return false;
    }

    public function edit(User $user, EmployeeSpecialLeave $leave)
    {
        if (($leave->is_owner) && $leave->isStatus('filed')) {
            return true;
        }
        return false;
    }

    public function store(User $user, EmployeeSpecialLeave $leave)
    {
        if ($user->employee->leave_credit->hasAvailableSpecialLeaveCredits()) {
            return true;
        }
        return false;
    }

    public function approve(User $user, EmployeeSpecialLeave $leave)
    {
        $employee = $user->employee;
        if ($leave->employee->leave_credit->hasAvailableSpecialLeaveCredits()) {
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

    public function reject(User $user, EmployeeSpecialLeave $leave)
    {
        $employee = $user->employee;
        if ($leave->isStatus('filed') && ($leave->recommending_approval->id === $employee->id)) {
            return true;
        } elseif ($leave->isStatus('recommended') && ($leave->approved_by->id === $employee->id)) {
            return true;
        }
        return false;
    }

    public function cancel(User $user, EmployeeSpecialLeave $leave)
    {
        if ($user->id == $leave->employee->user->id) {
            if ($leave->isStatus('filed') or $leave->isStatus('accepted') or $leave->isStatus('pending')) {
                return true;
            }
        }
        return false;
    }

}

<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\User;

class EmployeePolicy
{

    public function update(User $user, Employee $employee)
    {
        return $employee->id == $user->employee->id;
    }

    public function show(User $user, Employee $employee)
    {
        if ($user->employee->id == $employee->id) {
            return true;
        } elseif ($user->isAdmin()) {
            return true;
        } elseif (($user->department && $employee->user->department) && $user->isDepartmentHead() && $user->department->id == $employee->user->department->id) {
            return true;
        }
        return false;
    }

}

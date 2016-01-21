<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\Todo;
use DNSCHumanResource\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class TodoPolicy
{
    use HandlesAuthorization;

    public function touch(User $user, Todo $todo)
    {
        if ($user->employee->id === $todo->employee->id) {
            return true;
        }
        return false;
    }

}

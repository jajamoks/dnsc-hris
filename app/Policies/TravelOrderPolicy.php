<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\TravelOrder;
use DNSCHumanResource\Models\User;
use HumanResource;

class TravelOrderPolicy
{

    public function create(User $user, TravelOrder $travel)
    {
        $employee = $user->employee;
        if ($user->isFinanceDirector() && getAdmin()) {
            return true;
        }
        if ($employee->approval_heirarchy && $employee->utility->can_file_travel_order && HumanResource::financeDirector()) {
            return true;
        }
        return false;
    }

    public function approve(User $user, TravelOrder $travel)
    {
        $employee = $user->employee;
        if ($travel->isStatus('filed') && ($travel->recommending_approval_id == $employee->id)) {
            return true;
        } elseif ($travel->isStatus('recommended') && ($travel->finance_director_id == $employee->id)) {
            return true;
        } elseif ($travel->isStatus('approved') && $employee->user->isPresident()) {
            return true;
        }
        return false;
    }

    public function cancel(User $user, TravelOrder $travel)
    {
        if ($user->id == $travel->employee->user->id) {
            if ($travel->isStatus('filed') or $travel->isStatus('accepted') or $travel->isStatus('pending')) {
                return true;
            }
        }
    }

    public function edit(User $user, TravelOrder $travel)
    {
        if ($user->employee->id == $travel->employee->id) {
            if ($travel->isStatus('filed')) {
                return false;
            }
        }
        return true;
    }
}

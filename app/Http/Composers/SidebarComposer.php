<?php

namespace DNSCHumanResource\Http\Composers;

use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\EmployeeSpecialLeave;
use DNSCHumanResource\Models\TravelOrder;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;

class SidebarComposer
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $user = $this->user;

        $travelOrderCount = 0;

        $regularLeaveCount = 0;

        $specialLeaveCount = 0;

        if ($user->employee && $user->employee->canApproveRegularLeave()) {
            $regularLeaveCount = $user->employee->regular_leave_recommending_approvals->merge($user->employee->regular_leave_approved_by)->count();
        }

        if ($user->employee && $user->employee->canApproveSpecialLeave()) {
            $specialLeaveCount = $user->employee->special_leave_recommending_approvals->merge($user->employee->special_leave_approved_by)->count();
        }

        if ($user->isAdmin()) {
            $regularLeaveCount = EmployeeLeave::approved()->count();

            $specialLeaveCount = EmployeeSpecialLeave::approved()->count();
        }

        if ($user->employee && $user->employee->canApproveTravelOrder()) {
            if ($user->isFinanceDirector()) {
                $travelOrderCount = TravelOrder::approved()->count();
            } else {
                $travelOrderCount = $user->employee->travel_order_recommending_approvals->merge($user->employee->travel_order_approved_by)->count();
            }
        }

        $view->with(compact('user', 'regularLeaveCount', 'specialLeaveCount', 'travelOrderCount'));
    }

}

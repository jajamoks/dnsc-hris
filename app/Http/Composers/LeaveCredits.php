<?php

namespace DNSCHumanResource\Http\Composers;

use Illuminate\Contracts\View\View;

class LeaveCredits
{

    protected $employee;

    public function __construct()
    {

    }

    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $employee = $view->getData()['employee'];

        $credit      = $employee->leave_credit;
        $accumulated = $employee->accumulated_leave;

        $leaveCredits     = collect();
        $accumulatedLeave = collect();

        $leaveCredits->push([
            'title' => 'Force Leave',
            'icon'  => 'envelope',
            'color' => 'warning',
            'count' => $credit->force_leave,
        ]);
        $leaveCredits->push([
            'title' => 'Special Leave',
            'icon'  => 'star',
            'color' => 'primary',
            'count' => $credit->special_leave,
        ]);

        $accumulatedLeave->push([
            'title' => 'Vacation Leave',
            'icon'  => 'plane',
            'count' => $accumulated->vacation_leave,
        ]);
        $accumulatedLeave->push([
            'title' => 'Sick Leave',
            'icon'  => 'hospital-o',
            'count' => $accumulated->sick_leave,
        ]);
        $accumulatedLeave->push([
            'title' => 'Total Accumulated Leave',
            'icon'  => 'plus',
            'count' => $accumulated->total(),
        ]);

        $view->with(compact('leaveCredits', 'accumulatedLeave'));
    }

}

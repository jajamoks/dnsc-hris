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

        $credit = $employee->leave_credit;

        $accumulated = $employee->accumulated_leave;

        $credits = collect();

        $credits->push([
            'title' => 'Force leave',
            'icon'  => 'envelope',
            'color' => 'warning',
            'count' => $credit->force_leave,
        ]);

        $credits->push([
            'title' => 'Special leave',
            'icon'  => 'star',
            'color' => 'primary',
            'count' => $credit->special_leave,
        ]);

        $credits->push([
            'title' => 'Vacation leave',
            'icon'  => 'plane',
            'color' => 'primary',
            'count' => $accumulated->vacation_leave,
        ]);

        $credits->push([
            'title' => 'Sick leave',
            'icon'  => 'hospital-o',
            'color' => 'danger',
            'count' => $accumulated->sick_leave,
        ]);

        $view->with(compact('credits'));
    }

}

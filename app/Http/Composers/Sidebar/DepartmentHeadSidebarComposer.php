<?php

namespace DNSCHumanResource\Http\Composers;

use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;

class DepartmentHeadSidebarComposer
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
        $user              = $this->user;
        $travelOrderCount  = TravelOrder::filed()->where('recommending_approval', $this->user->employee->id)->count();
        $regularLeaveCount = EmployeeLeave::where('recommending_approval', $user->employee->id)->filed()->count();
        $specialLeaveCount = EmployeeSpecialLeave::where('recommending_approval', $user->employee->id)->filed()->count();

        $view->with(compact('user', 'travelOrderCount', 'regularLeaveCount', 'specialLeaveCount'));
    }

}

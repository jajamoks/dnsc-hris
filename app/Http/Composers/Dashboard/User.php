<?php

namespace DNSCHumanResource\Http\Composers\Dashboard;

use Illuminate\Contracts\View\View;

class User
{

    /**
     * The user repository implementation.
     *
     * @var UserRepository
     */
    protected $user;

    /**
     * Create a new profile composer.
     *
     * @param  UserRepository  $users
     * @return void
     */
    public function __construct()
    {
        // Dependencies automatically resolved by service container...
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
        $employee = $this->user->employee;

        if ($employee) {

            $stats = collect();

            $stats->push([
                'title'       => 'Trainings',
                'class'       => 'info',
                'icon'        => 'calendar',
                'number'      => $employee->trainings->count(),
                'description' => 'Trainings and seminars participated',
                'url'         => '/calendar',
            ]);

            $stats->push([
                'title'       => 'Filed leaves',
                'class'       => 'success',
                'icon'        => 'file',
                'number'      => $employee->employee_leaves()->certified()->count() + $employee->employee_special_leaves()->certified()->count(),
                'description' => 'All time total filed leaves',
                'url'         => '/leave/personal',
            ]);

            $stats->push([
                'title'       => 'Travel orders',
                'class'       => 'warning',
                'icon'        => 'plane',
                'number'      => $employee->travel_orders()->certified()->count(),
                'description' => 'All time total filed travel orders',
                'url'         => '/travel',
            ]);

            $stats->push([
                'title'       => 'PBB',
                'class'       => 'danger',
                'icon'        => 'info',
                'number'      => ($employee->personnel_performance ? $employee->personnel_performance->average() : 0) . '%',
                'description' => 'Personnel performance rating',
                'url'         => '/employee/' . $employee->user->username,
            ]);

        }

        $view->with(compact('stats'));
    }

}

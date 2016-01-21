<?php

namespace DNSCHumanResource\Http\Composers\Dashboard;

use Carbon\Carbon;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\Training;
use DNSCHumanResource\Models\User;
use DNSCHumanResource\Repositories\SessionRepository;
use Illuminate\Contracts\View\View;
use Illuminate\Users\Repository as UserRepository;

class Admin
{

    /**
     * The user repository implementation.
     *
     * @var UserRepository
     */
    protected $user;

    /**
     * The session repository implementation.
     *
     * @var Session
     */
    protected $session;

    /**
     * Create a new profile composer.
     *
     * @param  UserRepository  $users
     * @return void
     */
    public function __construct(SessionRepository $session)
    {
        $this->user = auth()->user();

        $this->session = $session;
    }

    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        if (auth()->user()->employee) {
            $stats    = collect();
            $sessions = $this->session->getActiveUsers();

            $stats->push([
                'title'       => 'System users',
                'class'       => 'info',
                'icon'        => 'users',
                'number'      => User::count(),
                'description' => 'Registered user account in the system',
                'url'         => '/employee',
            ]);
            $stats->push([
                'title'       => 'User with PDS',
                'class'       => 'success',
                'icon'        => 'user',
                'number'      => round((Employee::count() / User::count()) * 100, 0) . '%',
                'description' => Employee::count() . ' employees with Personal Data Sheet',
                'url'         => '/employee',
            ]);
            $stats->push([
                'title'       => 'Leave Request',
                'class'       => 'danger',
                'icon'        => 'thumbs-o-up',
                'number'      => EmployeeLeave::approved()->count(),
                'description' => '<i class="fa fa-thumbs-o-up"></i>&nbsp;' . EmployeeLeave::count() . ' Total filed leaves',
                'url'         => 'leave',
            ]);
            $stats->push([
                'title'       => 'Upcoming Trainings',
                'class'       => 'warning',
                'icon'        => 'calendar',
                'number'      => Training::where('start', '>', Carbon::today())->count(),
                'description' => '<i class="fa fa-calendar"></i>&nbsp; ' . Training::count() . ' Trainings & Seminar',
                'url'         => '/calendar',
            ]);

            $view->with(compact('stats', 'sessions'));
        }
    }

}

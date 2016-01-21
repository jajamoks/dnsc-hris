<?php

namespace DNSCHumanResource\Providers;

use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\EmployeeSpecialLeave;
use DNSCHumanResource\Models\Form;
use DNSCHumanResource\Models\Message;
use DNSCHumanResource\Models\Todo;
use DNSCHumanResource\Models\TravelOrder;
use DNSCHumanResource\Policies\EmployeePolicy;
use DNSCHumanResource\Policies\FormPolicy;
use DNSCHumanResource\Policies\MessagePolicy;
use DNSCHumanResource\Policies\RegularLeavePolicy;
use DNSCHumanResource\Policies\SpecialLeavePolicy;
use DNSCHumanResource\Policies\TodoPolicy;
use DNSCHumanResource\Policies\TravelOrderPolicy;
use Illuminate\Contracts\Auth\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Employee::class             => EmployeePolicy::class,
        EmployeeLeave::class        => RegularLeavePolicy::class,
        EmployeeSpecialLeave::class => SpecialLeavePolicy::class,
        TravelOrder::class          => TravelOrderPolicy::class,
        Message::class              => MessagePolicy::class,
        Todo::class                 => TodoPolicy::class,
        Form::class                 => FormPolicy::class,
    ];

    /**
     * Register any application authentication / authorization services.
     *
     * @param  \Illuminate\Contracts\Auth\Access\Gate  $gate
     * @return void
     */
    public function boot(GateContract $gate)
    {

        $this->registerPolicies($gate);
        //
    }
}

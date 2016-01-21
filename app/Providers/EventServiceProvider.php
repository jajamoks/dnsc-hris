<?php

namespace DNSCHumanResource\Providers;

use Illuminate\Contracts\Events\Dispatcher as DispatcherContract;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'DNSCHumanResource\Events\NotificationCreated'    => [
            'DNSCHumanResource\Listeners\NotificationCreated',
        ],

        'DNSCHumanResource\Events\RegularLeaveFiled'      => [
            'DNSCHumanResource\Listeners\RegularLeaveFiled',
        ],
        'DNSCHumanResource\Events\RegularLeaveApproved'   => [
            'DNSCHumanResource\Listeners\RegularLeaveApproved',
        ],
        'DNSCHumanResource\Events\RegularLeaveRejected'   => [
            'DNSCHumanResource\Listeners\RegularLeaveRejected',
        ],

        'DNSCHumanResource\Events\SpecialLeaveFiled'      => [
            'DNSCHumanResource\Listeners\SpecialLeaveFiled',
        ],
        'DNSCHumanResource\Events\SpecialLeaveApproved'   => [
            'DNSCHumanResource\Listeners\SpecialLeaveApproved',
        ],
        'DNSCHumanResource\Events\SpecialLeaveRejected'   => [
            'DNSCHumanResource\Listeners\SpecialLeaveRejected',
        ],

        'DNSCHumanResource\Events\TravelOrderFiled'       => [
            'DNSCHumanResource\Listeners\TravelOrderFiled',
        ],
        'DNSCHumanResource\Events\TravelOrderApproved'    => [
            'DNSCHumanResource\Listeners\TravelOrderApproved',
        ],
        'DNSCHumanResource\Events\TravelOrderRejected'    => [
            'DNSCHumanResource\Listeners\TravelOrderRejected',
        ],
        'DNSCHumanResource\Events\EmployeeUtilityUpdated' => [
            'DNSCHumanResource\Listeners\EmployeeUtilityUpdated',
        ],
    ];

    protected $subscribe = [
        'DNSCHumanResource\Listeners\UserEventListener',
    ];

    /**
     * Register any other events for your application.
     *
     * @param  \Illuminate\Contracts\Events\Dispatcher  $events
     * @return void
     */
    public function boot(DispatcherContract $events)
    {
        parent::boot($events);

        //
    }
}

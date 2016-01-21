<?php

namespace DNSCHumanResource\Providers;

use Illuminate\Support\ServiceProvider;

class HumanResourceServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->bind('DNSCHumanResource\HumanResource\Contracts\Employee',
            'DNSCHumanResource\HumanResource\Repositories\EmployeeRepository');
        $this->app->bind('DNSCHumanResource\HumanResource\Contracts\RegularLeave',
            'DNSCHumanResource\HumanResource\Repositories\RegularLeaveRepository');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}

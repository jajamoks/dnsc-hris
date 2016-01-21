<?php

namespace DNSCHumanResource\Providers;

use DNSCHumanResource;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('layouts.sidebar', DNSCHumanResource\Http\Composers\SidebarComposer::class);
        view()->composer('dashboard.admin', DNSCHumanResource\Http\Composers\Dashboard\Admin::class);
        view()->composer('dashboard.user', DNSCHumanResource\Http\Composers\Dashboard\User::class);
        view()->composer('leaves.partials.leave_credits', DNSCHumanResource\Http\Composers\LeaveCredits::class);
        view()->composer('layouts.navbar-partials.mega-dropdown', DNSCHumanResource\Http\Composers\SidebarComposer::class);
    }

    /**
     * Register
     *
     * @return void
     */
    public function register()
    {
        //
    }

}

<?php

namespace DNSCHumanResource\Providers;

use Illuminate\Support\ServiceProvider;
use Validator;

class ValidatorServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        Validator::extend('validate_auth_user', 'DNSCHumanResource\Validators\CustomValidators@validate_auth_user');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {

    }
}

<?php

namespace DNSCHumanResource\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            \DNSCHumanResource\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \DNSCHumanResource\Http\Middleware\VerifyCsrfToken::class,
            \DNSCHumanResource\Http\Middleware\LanguageMiddleware::class,
        ],

        'api' => [
            'throttle:60,1',
            \DNSCHumanResource\Http\Middleware\APIMiddleware::class,
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \DNSCHumanResource\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'guest' => \DNSCHumanResource\Http\Middleware\RedirectIfAuthenticated::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'admin' => \DNSCHumanResource\Http\Middleware\AdminMiddleware::class,
        'employee' => \DNSCHumanResource\Http\Middleware\EmployeeMiddleware::class,
        'role' => \DNSCHumanResource\Http\Middleware\RoleMiddleware::class,
    ];
}

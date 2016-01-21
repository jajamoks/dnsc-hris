<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Application Version
    |--------------------------------------------------------------------------
    |
    | This is your application version
    | example: PRODUCTION, BETA, ALPHA
    |
     */

    'app-version'    => env('APP_VERSION'),

    /*
    |--------------------------------------------------------------------------
    | Site Title
    |--------------------------------------------------------------------------
    |
    | This is where your site title goes. This will be used in the title tag
    | in you html content.
    |
     */

    'site-title'     => 'DNSC Human Resource Information System',

    /*
    |--------------------------------------------------------------------------
    | Profile Design
    |--------------------------------------------------------------------------
    |
    | You can choose between default and original as your profile design
    |
     */

    'profile-design' => 'default',

    /*
    |--------------------------------------------------------------------------
    | User Accounts
    |--------------------------------------------------------------------------
    |
    | Default user account used by your system
    |
     */

    'users'          => [

        'admin', 'users', 'president',

    ],

    /*
    |--------------------------------------------------------------------------
    | Currency
    |--------------------------------------------------------------------------
    |
    | Set your default currency used by your system
    |
     */

    'currency'       => 'Php',

    /*
    |--------------------------------------------------------------------------
    | Site Meta
    |--------------------------------------------------------------------------
    |
    | Site meta will be displayed in meta tags inside the head tag in your
    | html pages.
    |
     */

    'meta'           => [

        'description' => 'A Davao del Norte State College Human Resource Information System',

        'keywords'    => 'Human Resource,HRIS,University,College,Information System',

        'author'      => 'Rosemale-John II C. Villacorta',

    ],

    /*
    |--------------------------------------------------------------------------
    | Itexmo API Code
    |--------------------------------------------------------------------------
    |
    | Used when sending messages to the users. Like notify users via sms.
    |
     */

    'itexmo'         => [

        'api' => env('ITEXMO_API_CODE'),

    ],

];

<?php

namespace DNSCHumanResource\Listeners;

use Carbon\Carbon as Carbon;
use Illuminate\Http\Request;

class UserEventListener
{

    public function onUserLogin($user, $remember)
    {
        $request          = Request::capture();
        $user->last_login = Carbon::now();
        $user->ip_address = $request->ip();
        $user->save();
    }

    public function onUserLogout($user)
    {
        $user->last_logout = Carbon::now();
        $user->save();
        flash()->success('You have logged out!');
    }

    public function subscribe($events)
    {
        $events->listen(
            'auth.login',
            'DNSCHumanResource\Listeners\UserEventListener@onUserLogin'
        );

        $events->listen(
            'auth.logout',
            'DNSCHumanResource\Listeners\UserEventListener@onUserLogout'
        );
    }
}

<?php

namespace DNSCHumanResource\Repositories;

use DNSCHumanResource\Models\Session;

class SessionRepository
{

    public function getActiveUsers()
    {
        $sessions = Session::has('user')->with('user.employee')->get()->reject(function ($session) {
            return $session->user->id === auth()->user()->id;
        })->unique('user_id');
        return $sessions;
    }

}

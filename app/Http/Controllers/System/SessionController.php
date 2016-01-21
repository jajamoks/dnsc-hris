<?php

namespace DNSCHumanResource\Http\Controllers\System;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Repositories\SessionRepository;

class SessionController extends Controller
{

    public function getActiveUsers(SessionRepository $session)
    {
        $sessions = $session->getActiveUsers();
        return view('system.active-user')->with(compact('sessions'));
    }

}

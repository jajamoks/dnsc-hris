<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;

class SystemController extends Controller
{

    public function index()
    {
        return view('system.info');
    }

    public function getConfig()
    {
        return view('system.config');
    }

    public function contactDevelopers()
    {
        return view('system.contact-developers');
    }

}

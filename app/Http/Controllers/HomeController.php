<?php

namespace DNSCHumanResource\Http\Controllers;

use Auth;

class HomeController extends Controller
{
    public function about()
    {
        return view('about');
    }

    public function index()
    {
        $page_title = 'Dashboard';
        $employee   = Auth::user()->employee;

        if (Auth::user()->isAdmin()) {
            return view('admin.dashboard')
                ->with(compact('employee', 'page_title'));
        }
        return view('user.dashboard')
            ->with(compact('employee', 'page_title'));
    }

    public function settings()
    {
        $page_title = 'Settings';
        return view('user.settings')->with(compact('page_title'));
    }
}

<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\User;

class DashboardController extends Controller
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $employee = auth()->user()->employee;
        if ($this->user->isAdmin()) {
            return view('dashboard.admin');
        } elseif ($this->user->isPresident()) {
            return view('dashboard.admin');
        } else {
            return view('dashboard.user')->with(compact('employee'));
        }
    }
}

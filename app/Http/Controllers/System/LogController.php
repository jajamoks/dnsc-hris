<?php

namespace DNSCHumanResource\Http\Controllers\System;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Notification;
use Illuminate\Http\Request;

class LogController extends Controller
{

    public function index()
    {
        $notifications = $notifications = Notification::orderBy('created_at', 'desc')->simplePaginate(15);
        return view('system.logs')->with(compact('notifications'));
    }

    public function clear(Request $request)
    {
        $notifications = Notification::with('id')->delete();
        return redirect()->back();
    }

}

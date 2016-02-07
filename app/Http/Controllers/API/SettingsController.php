<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SettingsController extends Controller
{

    public $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    public function getSettings()
    {
        return response()->json($this->user->settings, 200);
    }

    public function updateSettings(Request $request)
    {
        $settings = $this->user->settings->update($request->all());
        return response()->json($request->user()->settings, 200);
    }

}

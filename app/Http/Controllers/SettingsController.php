<?php

namespace DNSCHumanResource\Http\Controllers;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;
use Session;

class SettingsController extends Controller
{
    protected $auth;

    public function __construct(Guard $auth)
    {
        $this->auth = $auth;
    }

    public function index()
    {
        return view('user.settings');
    }

    public function update(Request $request)
    {
        $setting = $this->auth->user()->settings()->first();

        $setting->update($request->all());

        return response()->json('Settings updated!', 200);
    }

    public function changeLanguage($locale)
    {
        flash()->success(trans('messages.language-changed', ['locale' => $locale]));
        Session::set('locale', $locale);
        return redirect()->back();
    }
}

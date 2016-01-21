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

        $setting->notify_via_system = $request->input('notify_via_system') or 'off';
        $setting->notify_via_email  = $request->input('notify_via_email') or 'off';
        $setting->notify_via_sms    = $request->input('notify_via_sms') or 'off';

        if ($setting->save()) {
            flash()->success('Settings successfully saved.');
            return redirect()->back();
        } else {
            flash()->error('Settings not saved.');
            return redirect()->back();
        }

    }

    public function changeLanguage($locale)
    {
        flash()->success(trans('messages.language-changed', ['locale' => $locale]));
        Session::set('locale', $locale);
        return redirect()->back();
    }
}

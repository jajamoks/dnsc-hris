<?php namespace DNSCHumanResource\Traits;

use Illuminate\Http\Request;
use ReCaptcha\ReCaptcha as ReCaptcha;

trait CaptchaTrait
{

    public function checkCaptcha()
    {
        $request  = Request::capture();
        $response = $request->get('g-recaptcha-response');
        $remoteIP = $request->ip();
        $secret   = env('RECAPTCHA_SECRET_KEY');

        $reCaptcha = new ReCaptcha($secret);
        $result    = $reCaptcha->verify($response, $remoteIP);
        if ($result->isSuccess()) {
            return true;
        } else {
            return false;
        }
    }

}

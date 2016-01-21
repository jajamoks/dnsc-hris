<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Form;

class FormController extends Controller
{

    public function index()
    {
        $forms = Form::take(200)->get();
        return response()->json($forms, 200);
    }

}

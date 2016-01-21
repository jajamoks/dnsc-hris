<?php

namespace DNSCHumanResource\Validators;

use Auth;

class CustomValidators
{

    public function validate_auth_user($attribute, $value, $parameters, $validator)
    {
        return Auth::validate([
            'username' => Auth::user()->username,
            'password' => $value,
        ]);
    }

}

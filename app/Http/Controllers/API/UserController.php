<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;

class UserController extends Controller
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    public function getAuthenticatedUser()
    {
        return $this->user;
    }

}

<?php

namespace DNSCHumanResource\Http\Controllers\Auth;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\User;
use DNSCHumanResource\Traits\Auth\AuthenticatesAndRegistersUsers;
use Hash;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Validator;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
     */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/dashboard';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => ['logout', 'register']]);
        $this->middleware('auth', ['only' => 'register']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'username' => 'required',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        $user = User::create([
            'username'      => $data['username'],
            'type'          => $data['type'],
            'password'      => Hash::make($data['username']),
            'department_id' => isset($data['department_id']) ? $data['department_id'] : null,
        ]);
        $user->positions()->attach($data['positions']);
        return $user;
    }
}

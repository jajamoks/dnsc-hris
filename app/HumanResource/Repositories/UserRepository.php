<?php namespace DNSCHumanResource\HumanResource\Repositories;

use DNSCHumanResource\User;

class UserRepository
{

    public function getAllUsers()
    {
        return User::with('employees', 'positions', 'department')->get();
    }

    public function getAllUserCount()
    {
        return User::count();
    }

}

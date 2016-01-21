<?php

namespace DNSCHumanResource\HumanResource;

use DNSCHumanResource\Models\User;

class DNSCHumanResource
{

    public static function admin()
    {
        return User::where('type', 'admin')->orderBy('created_at', 'desc')->first();
    }

    public static function president()
    {
        return self::checkIfNull(User::where('type', 'president')->orderBy('created_at', 'desc')->first());
    }

    public static function financeDirector()
    {
        $user = User::financeDirector()->orderBy('created_at', 'desc')->first();
        return self::checkIfNull($user);
    }

    public static function departmentHead()
    {
        if (auth()->user()->department && auth()->user()->department->head()) {
            return auth()->user()->department->head()->employee;
        }
        return null;
    }

    protected static function checkIfNull($data)
    {
        if ($data != null) {
            return $data->employee;
        }
        return null;
    }

}

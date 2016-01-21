<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeChild extends Model
{

    protected $table = 'employee_child';

    protected $fillable = ['name', 'birthday'];

}

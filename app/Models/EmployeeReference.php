<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeReference extends Model
{

    protected $fillable = ['name', 'address', 'telephone_number'];

    public $timestamps = false;
}

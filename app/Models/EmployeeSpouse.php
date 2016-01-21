<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeSpouse extends Model
{

    protected $table = 'employee_spouse';

    protected $fillable = ['last_name', 'first_name', 'middle_name', 'occupation', 'employer_business_name', 'business_address', 'telephone_number'];

    public $timestamps = false;

}

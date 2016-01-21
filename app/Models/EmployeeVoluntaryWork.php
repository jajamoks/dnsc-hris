<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeVoluntaryWork extends Model
{

    protected $fillable = ['organization_name', 'organization_address', 'date_from', 'date_to', 'number_of_hours', 'position'];

}

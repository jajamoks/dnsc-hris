<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeCivilService extends Model
{

    protected $fillable = ['career_service', 'rating', 'examination_date', 'examination_place', 'license_number', 'release_date'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}

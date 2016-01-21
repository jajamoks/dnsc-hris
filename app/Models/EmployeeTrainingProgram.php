<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeTrainingProgram extends Model
{

    protected $fillable = ['title', 'date_from', 'date_to', 'number_of_hours', 'sponsored_by'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

}

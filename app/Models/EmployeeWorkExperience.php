<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeWorkExperience extends Model
{

    protected $fillable = ['date_from', 'date_to', 'position_title', 'company', 'monthly_salary', 'salary_grade', 'status_of_appointment', 'government_service'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}

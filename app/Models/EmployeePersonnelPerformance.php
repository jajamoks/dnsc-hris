<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeePersonnelPerformance extends Model
{
    protected $fillable = ['strategic_function', 'core_function'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function average()
    {
        return $this->strategic_function + $this->core_function;
    }
}

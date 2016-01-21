<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeSkill extends Model
{

    protected $fillable = ['skill'];

    protected $touches = ['employee'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

}

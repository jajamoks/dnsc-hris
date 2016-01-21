<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeLeaveCredit extends Model
{

    protected $fillable = ['force_leave', 'special_leave'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function hasAvailableForceLeaveCredits()
    {
        return $this->force_leave > 0;
    }

    public function hasAvailableSpecialLeaveCredits()
    {
        return $this->special_leave > 0;
    }

}

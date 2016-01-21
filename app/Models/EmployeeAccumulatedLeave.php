<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeAccumulatedLeave extends Model
{
    protected $fillable = ['sick_leave', 'vacation_leave'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function total()
    {
        return $this->vacation_leave + $this->sick_leave;
    }

    public function hasAvailableVacationLeaveCredits($days)
    {
        return ($this->vacation_leave + $this->employee->leave_credit->force_leave) >= $days;
    }

    public function hasAvailableSickLeaveCredits($days)
    {
        return ($this->sick_leave + $this->employee->leave_credit->force_leave) >= $days;
    }

}

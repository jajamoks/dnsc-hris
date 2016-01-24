<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeePersonnelLeaveCard extends Model
{

    protected $fillable = [
        'particulars',
        'vl_earned',
        'vl_deduction_with_pay',
        'vl_balance',
        'vl_deduction_without_pay',
        'sl_earned',
        'sl_deduction_with_pay',
        'sl_balance',
        'sl_deduction_without_pay',
        'remarks',
    ];

    protected $appends = ['total'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function getTotalAttribute()
    {
        return $this->vl_balance + $this->sl_balance;
    }

}

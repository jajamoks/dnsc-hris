<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeApprovalHeirarchy extends Model
{

    protected $fillable = ['recommending_approval_id', 'approved_by_id'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function recommending_approval()
    {
        return $this->belongsTo(Employee::class, 'recommending_approval_id');
    }

    public function approved_by()
    {
        return $this->belongsTo(Employee::class, 'approved_by_id');
    }

}

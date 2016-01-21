<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeAddress extends Model
{

    protected $table = 'employee_address';

    protected $fillable = ['address', 'zip_code', 'telephone_number', 'address_type'];

    protected $touches = ['employee'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function scopeResidential($query)
    {
        return $query->where('address_type', 'residential')->first();
    }

    public function scopePermanent($query)
    {
        return $query->where('address_type', 'permanent')->first();
    }

}

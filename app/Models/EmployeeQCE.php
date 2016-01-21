<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeQCE extends Model
{

    protected $fillable = ['instruction', 'self', 'supervisor', 'peers'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function total()
    {
        return $this->instruction + $this->self + $this->supervisor + $this->peers;
    }

}

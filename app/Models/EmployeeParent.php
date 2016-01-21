<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeParent extends Model
{

    protected $fillable = ['first_name', 'middle_name', 'last_name', 'relationship'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function scopeFather($query)
    {
        return $query->where('relationship', 'father')->first();
    }

    public function scopeMother($query)
    {
        return $query->where('relationship', 'mother')->first();
    }

    public function fullName()
    {
        return $this->first_name . ' ' . $this->middle_name . ' ' . $this->last_name;
    }

}

<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeUtility extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'can_file_sick_leave', 'can_file_vacation_leave', 'can_file_special_leave', 'can_file_travel_order',
    ];

    protected $casts = [
        'can_file_sick_leave'     => 'boolean',
        'can_file_vacation_leave' => 'boolean',
        'can_file_special_leave'  => 'boolean',
        'can_file_travel_order'   => 'boolean',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function canFileRegularLeave()
    {
        return $this->can_file_sick_leave or $this->can_file_vacation_leave;
    }
}

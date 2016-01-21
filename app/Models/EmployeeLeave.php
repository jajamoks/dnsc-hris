<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Events\RegularLeaveFiled;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class EmployeeLeave extends Model
{
    use Notificationable;

    protected $fillable = ['working_days_applied', 'start_date', 'end_date', 'commutation', 'leave_type', 'additional_info', 'status', 'recommending_approval_id', 'approved_by_id', 'certified_by_id', 'file'];

    protected $notification = ['url' => '/leave/regular/', 'findBy' => 'id'];

    protected $appends = ['file_path'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($leave) {
            event(new RegularLeaveFiled($leave));
        });
    }

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

    public function certified_by()
    {
        return $this->belongsTo(Employee::class, 'certified_by_id');
    }

    public function scopeFiled($query)
    {
        return $query->where('status', 'filed');
    }

    public function scopeRecommended($query)
    {
        return $query->where('status', 'recommended');
    }

    public function scopeApproved($query)
    {
        return $query->where('status', 'approved');
    }

    public function scopeCertified($query)
    {
        return $query->where('status', 'certified');
    }

    public function scopeVacation($query)
    {
        return $query->where('leave_type', 'vacation');
    }

    public function scopeSick($query)
    {
        return $query->where('leave_type', 'sick');
    }

    public function isStatus($status)
    {
        return $this->status == $status;
    }

    public function isLeaveType($type)
    {
        return $this->leave_type == $type;
    }

    public function scopeApprovedVacationLeave($query, Employee $employee)
    {
        return $query->where('employee_id', $employee->id)->vacation()->approved();
    }

    public function scopeApprovedSickLeave($query, Employee $employee)
    {
        return $query->where('employee_id', $employee->id)->sick()->approved();
    }

    public function fileName()
    {
        return str_slug('regular leave ' . $this->employee->user->username . ' ' . date('Y m d H i s', strtotime($this->created_at)), '-');
    }

    public function getFilePathAttribute()
    {
        $path = public_path('files/RegularLeaveForms/' . $this->file);
        if (file_exists($path) && is_file($path)) {
            return $path;
        }
        return null;
    }

}

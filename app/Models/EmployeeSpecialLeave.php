<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Events\SpecialLeaveFiled;
use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class EmployeeSpecialLeave extends Model
{

    use Notificationable;

    protected $fillable = ['type', 'number_of_days', 'date_from', 'date_to', 'approved_by_id', 'recommending_approval_id', 'certified_by_id', 'file', 'status'];

    protected $notification = ['url' => '/leave/special/', 'findBy' => 'id'];

    protected $appends = ['file_path', 'is_owner'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($leave) {
            event(new SpecialLeaveFiled($leave));
        });
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function approved_by()
    {
        return $this->belongsTo(Employee::class, 'approved_by_id');
    }

    public function recommending_approval()
    {
        return $this->belongsTo(Employee::class, 'recommending_approval_id');
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

    public function isStatus($status)
    {
        return $this->status == $status;
    }

    public function isLeaveType($type)
    {
        return $this->type == $type;
    }

    public function fileName()
    {
        return str_slug('special leave ' . $this->employee->user->username . ' ' . date('Y m d H i s', strtotime($this->created_at)), '-');
    }

    public function getFilePathAttribute()
    {
        $path = public_path('files/SpecialLeaveForms/' . $this->file);
        if (file_exists($path) && is_file($path)) {
            return $path;
        }
        return null;
    }

    public function getIsOwnerAttribute()
    {
        if (auth()->user()->employee) {
            return $this->employee->id === auth()->user()->employee->id;
        }
        return false;
    }

    /**
     *  For notification routing
     */

    public function urlLink()
    {
        return '/leave/special/' . $this->id;
    }
}

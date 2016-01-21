<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class DepartmentHead extends Model
{

    use Notificationable;

    protected $fillable = ['employee_id', 'department_id'];

    protected $notification = ['url' => '/departments/', 'relation' => 'department', 'findBy' => 'code'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($department_head) {
            $department_head->notifications()->create([
                'sent_to' => Employee::find($department_head->employee_id)->user->id,
                'sent_by' => auth()->user()->id,
                'subject' => 'New designation',
                'message' => trans('notification.department_head-created', ['department' => $department_head->department->name, 'name' => auth()->user()->employee->fullName()]),
                'icon'    => 'institution',
                'color'   => 'warning',
            ]);
        });
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class, 'employee_id');
    }

    /**
     *  For notification routing
     */

    public function urlLink()
    {
        return '/departments/' . $this->department->code;
    }

}

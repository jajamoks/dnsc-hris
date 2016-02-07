<?php

namespace DNSCHumanResource\Models;

use Avatar;
use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

    use Notificationable;

    protected $fillable = ['username', 'email', 'password', 'department_id', 'position', 'type', 'status', 'signature'];

    protected $hidden = ['password', 'remember_token'];

    protected $notification = ['url' => '/employee/', 'findBy' => 'username'];

    protected $appends = ['is_faculty', 'photo', 'display_name', 'position_title', 'signature_path'];

    public static function boot()
    {
        parent::boot();

        static::created(function ($user) {
            $user->settings()->save(new Settings);
        });
    }

    public function employee()
    {
        return $this->hasOne(Employee::class);
    }

    public function positions()
    {
        return $this->belongsToMany(Position::class, 'user_positions')->orderBy('created_at', 'desc');
    }

    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id');
    }

    public function settings()
    {
        return $this->hasOne(Settings::class);
    }

    public function messages()
    {
        return $this->hasMany(Message::class, 'sender_id');
    }

    public function received_messages()
    {
        return $this->belongsToMany(Message::class, 'message_informations')->withPivot('is_read', 'time_seen');
    }

    public function message_groups()
    {
        return $this->belongsToMany(MessageGroup::class, 'message_group_members');
    }

    public function isAdmin()
    {
        return $this->type === 'admin';
    }

    public function isUser()
    {
        return $this->type === 'user';
    }

    public function isPresident()
    {
        return $this->type === 'president';
    }

    public function isFinanceDirector()
    {
        return $this->positions->contains('name', 'Finance Director');
    }

    public function isFaculty()
    {
        return $this->positions->contains('name', 'Faculty');
    }

    public function isDepartmentHead()
    {
        if (null === $this->department or null === $this->employee) {
            return false;
        } else {
            if (null === $this->department->head()) {
                return false;
            }
            return $this->employee->id == $this->department->head()->employee->id;
        }
    }

    public function isStatus($status)
    {
        return $this->status === $status;
    }

    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }

    public function scopeRetired($query)
    {
        return $query->where('status', 'retired');
    }

    public function scopeResigned($query)
    {
        return $query->where('status', 'resigned');
    }

    public function scopePresident($query)
    {
        return $query->whereType('president');
    }

    public function scopeAdmin($query)
    {
        return $query->whereType('admin');
    }

    public function scopeFinanceDirector($query)
    {
        return $query->with('positions')->whereHas('positions', function ($data) {
            return $data->where('name', 'finance director');
        });
    }

    public function notifications_sent_by_me()
    {
        return $this->hasMany(Notification::class, 'sent_by');
    }

    public function notifications_sent_to_me()
    {
        return $this->hasMany(Notification::class, 'sent_to');
    }

    public function messages_sent_by_me()
    {
        return $this->hasMany(Message::class, 'sender');
    }

    public function getIsFacultyAttribute()
    {
        return $this->isFaculty();
    }

    public function getPhotoAttribute()
    {
        if ($this->employee
            && !empty($this->employee->photo)
            && file_exists(public_path('uploads/' . $this->employee->photo))) {
            return '/imagecache/small/' . $this->employee->photo;
        }

        if ($this->employee) {
            return Avatar::create(studly_case($this->employee->first_name) . ' ' . $this->employee->middle_name . ' ' . $this->employee->surname)->toBase64()->encoded;
        }
        return Avatar::create($this->username)->toBase64()->encoded;
    }

    public function getDisplayNameAttribute()
    {
        return $this->employee ? $this->employee->full_name : $this->username;
    }

    public function getPositionTitleAttribute()
    {
        if ($this->positions->isEmpty()) {
            return 'No assigned position';
        }
        return (String) $this->positions->first()->name;
    }

    public function getSignaturePathAttribute()
    {
        $path = public_path('files/signatures/' . $this->username . '.png');
        if (file_exists($path) && is_file($path)) {
            return $path;
        }
        return null;
    }

    public function getRouteKeyName()
    {
        return 'username';
    }

}

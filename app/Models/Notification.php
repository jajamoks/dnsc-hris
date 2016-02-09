<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Events\NotificationCreated;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{

    protected $fillable = [
        'sent_to',
        'sent_by',
        'object_id',
        'object_type',
        'subject',
        'message',
        'is_read',
        'icon',
        'color',
    ];

    protected $casts = [
        'is_read' => 'boolean',
    ];

    protected $appends = ['url'];

    protected $with = ['object', 'sent_by_user'];

    public static function boot()
    {
        parent::boot();

        static::creating(function ($notification) {
            if ((auth()->user()->id === $notification->sent_to)
                or !$notification->sent_to_user->settings->notify_via_system) {
                return false;
            }
        });

        static::created(function ($notification) {
            event(new NotificationCreated($notification));
        });
    }

    public function object()
    {
        return $this->morphTo();
    }

    public function scopeUnread($query)
    {
        return $query->where('is_read', 0);
    }

    public function scopeRead($query)
    {
        return $query->where('is_read', 1);
    }

    public function sent_to_user()
    {
        return $this->belongsTo(User::class, 'sent_to');
    }

    public function sent_by_user()
    {
        return $this->belongsTo(User::class, 'sent_by');
    }

    public function getUrlAttribute()
    {
        return getNotificationLink($this);
    }
}

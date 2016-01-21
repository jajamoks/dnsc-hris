<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{

    protected $fillable = ['message_group_id', 'message', 'sender_id'];

    protected $appends = ['is_sender', 'is_read', 'users_who_already_read'];

    public function message_group()
    {
        return $this->belongsTo(MessageGroup::class);
    }

    public function sender()
    {
        return $this->belongsTo(User::class);
    }

    public function recipients()
    {
        return $this->belongsToMany(User::class, 'message_informations')->withPivot('is_read', 'time_seen');
    }

    public function scopeUnread($query)
    {
        return $query->where('message_informations.is_read', 0)->where('sender_id', '!=', auth()->user()->id)->orderBy('created_at', 'desc');
    }

    /*
     * JSON Model Serialization
     */

    public function getIsSenderAttribute()
    {
        return $this->attributes['sender_id'] == auth()->user()->id;
    }

    public function getIsReadAttribute()
    {
        $model = $this->recipients()->where('user_id', auth()->user()->id)->first();
        return $model && $model->pivot->is_read;
    }

    public function getUsersWhoAlreadyReadAttribute()
    {
        return $this->recipients()->with('employee')->where('is_read', 1)->get()->reject(function ($recipient) {
            return auth()->user()->id === $recipient->id;
        });
    }

}

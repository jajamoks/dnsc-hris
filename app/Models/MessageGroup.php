<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class MessageGroup extends Model
{

    protected $fillable = ['name', 'owner_id'];

    protected $appends = ['is_group', 'participants', 'group_name', 'is_group_owner'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'message_group_members');
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    public function owner()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function isGroup()
    {
        return $this->users->count() > 2;
    }

    public function isGroupOwner()
    {
        return $this->owner_id === auth()->user()->id;
    }

    public function participants()
    {
        return $this->users()->with('employee', 'positions')->get()->reject(function ($user) {
            return $user->id === auth()->user()->id;
        })->values();
    }

    public function groupName()
    {
        $name = '';
        if ($this->name) {
            return $this->name;
        }
        foreach ($this->participants() as $key => $participant) {
            $name .= $participant->employee ? $participant->employee->fullName() : $participant->username;
            if ($key < count($this->participants()) - 1) {
                $name .= ', ';
            }
        }
        return $name;
    }

    public function getIsGroupAttribute()
    {
        return $this->isGroup();
    }

    public function getParticipantsAttribute()
    {
        return $this->participants();
    }

    public function getGroupNameAttribute()
    {
        return $this->groupName();
    }

    public function getIsGroupOwnerAttribute()
    {
        return $this->isGroupOwner();
    }

}

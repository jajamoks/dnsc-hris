<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Position extends Model
{

    protected $fillable = ['name'];

    protected $touches = ['users'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_positions');
    }

}

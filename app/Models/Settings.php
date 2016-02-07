<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{

    protected $fillable = [
        'user_id', 'notify_via_system', 'notify_via_email', 'notify_via_sms', 'language',
    ];

    protected $casts = [
        'notify_via_system' => 'boolean',
        'notify_via_email' => 'boolean',
        'notify_via_sms' => 'boolean',
    ];

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}

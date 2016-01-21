<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Form extends Model
{

    protected $fillable = ['name', 'description', 'path', 'type', 'restricted'];

    protected $casts = [
        'restricted' => 'boolean',
    ];

    public function isRestricted()
    {
        return $this->restricted;
    }

}

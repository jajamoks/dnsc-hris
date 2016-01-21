<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    protected $fillable = ['model', 'message', 'code', 'file', 'line', 'trace'];
}

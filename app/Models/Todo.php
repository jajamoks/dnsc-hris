<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    protected $fillable = ['todo', 'is_done'];

    protected $casts = [
        'is_done' => 'boolean',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function isDone()
    {
        return $this->is_done == 1;
    }
}

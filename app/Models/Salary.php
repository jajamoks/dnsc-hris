<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Salary extends Model
{
    protected $table = 'salary';

    protected $fillable = ['salary_grade', 'salary'];

    public $timestamps = false;

    public function employees()
    {
        return $this->hasMany(Employee::class);
    }
}

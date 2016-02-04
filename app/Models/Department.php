<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{

    protected $fillable = ['code', 'name', 'type'];

    protected $with = ['employees'];

    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function employees()
    {
        return $this->hasManyThrough(Employee::class, User::class);
    }

    public function department_heads()
    {
        return $this->hasMany(DepartmentHead::class);
    }

    public function scopeInstitute($query)
    {
        return $query->whereType('institute');
    }

    public function scopeDepartment($query)
    {
        return $query->whereType('department');
    }

    public function head()
    {
        if ($this->department_heads) {
            return $this->department_heads->last();
        }
        return null;
    }

    public function getRouteKeyName()
    {
        return 'code';
    }

}

<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeEducation extends Model
{

    protected $fillable = ['level', 'school', 'degree_course', 'year_graduated', 'highest_level', 'start', 'end', 'academic_honors'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function isEducationLevel($level)
    {
        return $this->level === $level;
    }

    public function scopeElementary($query)
    {
        return $query->where('level', 'elementary');
    }

    public function scopeSecondary($query)
    {
        return $query->where('level', 'secondary');
    }

    public function scopeVocational($query)
    {
        return $query->where('level', 'vocational');
    }

    public function scopeCollege($query)
    {
        return $query->where('level', 'college');
    }

    public function scopeGraduateStudies($query)
    {
        return $query->where('level', 'graduate studies');
    }

}

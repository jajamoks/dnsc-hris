<?php

namespace DNSCHumanResource\Models;

use Carbon\Carbon;
use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class Training extends Model
{

    use Notificationable;

    protected $fillable = [
        'title', 'description', 'venue', 'start', 'end', 'number_of_hours', 'sponsored_by',
    ];

    protected $appends = ['is_done', 'inclusive_dates'];

    protected $notificaton = ['url' => '/trainings/', 'findBy' => 'id'];

    public function employees()
    {
        return $this->belongsToMany(Employee::class, 'training_participants', 'training_id', 'employee_id')->withPivot('include_in_pds', 'rvsp');
    }

    public function scopeFinishedTrainings($query)
    {
        return $query->where('end', '<', Carbon::today());
    }

    public function scopeUnfinished($query)
    {
        return $query->where('end', '>', Carbon::today());
    }

    public function scopeIncludedInPds($query)
    {
        return $query->where('training_participants.include_in_pds', 1);
    }

    public function scopeGoing()
    {
        return $query->where('training_participants.rvsp', 'going');
    }

    public function scopeNotGoing()
    {
        return $query->where('training_participants.rvsp', 'not going');
    }

    public function isDone()
    {
        return $this->end < Carbon::today();
    }

    public function getIsDoneAttribute()
    {
        return $this->isDone();
    }

    public function getInclusiveDatesAttribute()
    {
        return $this->inclusiveDates();
    }

    public function inclusiveDates()
    {
        return date('M d Y', strtotime($this->start)) . ' - ' . date('M d Y', strtotime($this->end));
    }
}

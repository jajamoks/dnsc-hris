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

    protected $appends = ['is_done', 'inclusive_dates', 'is_going', 'include_in_pds'];

    protected $notificaton = ['url' => '/trainings/', 'findBy' => 'id'];

    protected $with = ['employees.user'];

    // public function newPivot(Model $parent, array $attributes, $table, $exists)
    // {
    //     if ($parent instanceof Employee) {
    //         return new TrainingParticipant($parent, $attributes, $table, $exists);
    //     }

    //     return parent::newPivot($parent, $attributes, $table, $exists);
    // }

    public function employees()
    {
        return $this->belongsToMany(Employee::class, 'training_participants', 'training_id', 'employee_id')
            ->withPivot('include_in_pds', 'rvsp');
    }

    public function scopeFinishedTrainings($query)
    {
        return $query->where('end', '<=', Carbon::today());
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
        return $this->end <= Carbon::today();
    }

    public function getIsDoneAttribute()
    {
        return $this->isDone();
    }

    public function getInclusiveDatesAttribute()
    {
        return $this->inclusiveDates();
    }

    public function getIsGoingAttribute()
    {
        if ($this->pivot) {
            return $this->pivot->rvsp === 'going';
        }
        return null;
    }

    public function getIncludeInPdsAttribute()
    {
        if ($this->pivot) {
            return $this->pivot->include_in_pds === 1;
        }
        return null;
    }

    public function inclusiveDates()
    {
        return date('M d Y', strtotime($this->start)) . ' - ' . date('M d Y', strtotime($this->end));
    }
}

<?php

namespace DNSCHumanResource\Models;

use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class TrainingParticipant extends Model
{

    use Notificationable;

    protected $fillable = [
        'training_id', 'employee_id',
    ];

    protected $casts = [
        'include_in_pds' => 'boolean',
    ];

    protected $notification = ['url' => '/trainings/', 'relation' => 'training', 'findBy' => 'id'];

    public static function boot()
    {
        parent::boot();
        static::created(function ($training_participant) {
            $training_participant->notifications()->create([
                'sent_to' => $training_participant->employee->user->id,
                'sent_by' => auth()->user()->id,
                'subject' => 'Trainings and Seminar',
                'message' => 'You are invited to join the "' . $training_participant->training->title . '" event.',
                'icon'    => 'calendar',
                'color'   => 'info',
            ]);
        });
    }

    public function training()
    {
        return $this->belongsTo(Training::class, 'training_id');
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

}

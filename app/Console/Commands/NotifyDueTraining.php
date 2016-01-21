<?php

namespace DNSCHumanResource\Console\Commands;

use Carbon\Carbon as Carbon;
use DNSCHumanResource\Models\Training;
use Illuminate\Console\Command;
use Illuminate\Contracts\Bus\SelfHandling;

class NotifyDueTraining extends Command implements SelfHandling
{

    protected $signature = 'notify:training';

    protected $description = 'Notify employee if training is due';
    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the command.
     *
     * @return void
     */
    public function handle()
    {
        foreach (Training::where('start', Carbon::today())->get() as $training) {
            $training->employees->each(function ($employee) use ($training) {
                $training->notifications()->create([
                    'sent_to' => $employee->user->id,
                    'sent_by' => getAdmin()->id,
                    'subject' => 'Trainings and Seminar',
                    'message' => $training->title . ' is scheduled to start today!',
                    'icon'    => 'calendar',
                    'color'   => 'primary',
                ]);
            });
        }
        foreach (Training::where('end', Carbon::today())->get() as $training) {
            $training->employees->each(function ($employee) use ($training) {
                $training->notifications()->create([
                    'sent_to' => $employee->user->id,
                    'sent_by' => getAdmin()->id,
                    'subject' => 'Trainings and Seminar',
                    'message' => $training->title . ' is scheduled to end today! Share us your thoughts.',
                    'icon'    => 'calendar',
                    'color'   => 'primary',
                ]);
            });
        }
        $this->info('Participants are all notified!');
    }
}

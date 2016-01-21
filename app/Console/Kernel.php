<?php

namespace DNSCHumanResource\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        Commands\Inspire::class,
        Commands\ResetLeaveCredits::class,
        Commands\NotifyDueTraining::class,
        Commands\IncrementLeaveCredit::class,
        Commands\Clean::class,
        Commands\RedisSubscribe::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('leave-credit:reset')->yearly();
        $schedule->command('leave-credit:increment')->monthly();
        $schedule->command('notify:training')->daily();
    }
}

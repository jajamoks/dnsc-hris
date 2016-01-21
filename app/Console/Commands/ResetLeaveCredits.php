<?php

namespace DNSCHumanResource\Console\Commands;

use DNSCHumanResource\Models\Employee;
use Illuminate\Console\Command;
use Illuminate\Contracts\Bus\SelfHandling;

class ResetLeaveCredits extends Command implements SelfHandling
{

    protected $signature = 'leave-credit:reset';

    protected $description = 'Reset employee leave credits every year.';

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
        foreach (Employee::with('leave_credit')->get() as $employee) {
            $utility = $employee->utility;
            $employee->leave_credit->update([
                'force_leave'   => $utility->can_file_force_leave ? 5 : 0,
                'special_leave' => $utility->can_file_special_leave ? 3 : 0,
            ]);
        }

        $this->info('Leave credits successfully reset!');
    }
}

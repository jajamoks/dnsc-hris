<?php

namespace DNSCHumanResource\Console\Commands;

use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\User;
use Illuminate\Console\Command;

class IncrementLeaveCredit extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'leave-credit:increment';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Increment employee leave credit monthly.';

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
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $users = User::active()->has('employee')->with('employee.accumulated_leave', 'employee.utility', 'employee.personnel_leave_card')->get();

        foreach ($users as $user) {
            $employee = $user->employee;

            $utility = $employee->utility;

            $incrementedSickLeave = $utility->can_file_sick_leave ? 1.25 : 0;

            $incrementedVacationLeave = $utility->can_file_vacation_leave ? 1.25 : 0;

            $employee->accumulated_leave->update([
                'sick_leave'     => $incrementedSickLeave + $employee->accumulated_leave->sick_leave,
                'vacation_leave' => $incrementedVacationLeave + $employee->accumulated_leave->vacation_leave_leave,
            ]);

            $employee->personnel_leave_card()->create([
                'particulars' => 'Increment leave credit',
                'vl_earned'   => $incrementedVacationLeave,
                'vl_balance'  => $employee->accumulated_leave->vacation_leave,
                'sl_earned'   => $incrementedSickLeave,
                'sl_balance'  => $employee->accumulated_leave->sick_leave,
                'remarks'     => 'Increment leave credits',
            ]);
        }
        $this->info('Leave credits successfully incremented!');
    }
}

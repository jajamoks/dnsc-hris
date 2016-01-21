<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\EmployeeUtilityUpdated as Event;

class EmployeeUtilityUpdated
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  EmployeeUtilityUpdated  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $utility = $event->utility;

        $employee = $utility->employee;

        $new = $utility->getAttributes();

        $old = $utility->getOriginal();

        if ($old['can_file_vacation_leave'] != $new['can_file_vacation_leave']) {

            if ($old['can_file_vacation_leave']) {
                // pag ni false na ang can file vacation leave gikan true
                $accumulated_leave = $employee->accumulated_leave;

                $accumulated_leave->sick_leave = $accumulated_leave->total();

                $accumulated_leave->vacation_leave = 0;

            } else {
                // pag ni true ang can file vacation leave gikan false
                $accumulated_leave = $employee->accumulated_leave;

                $credit = $accumulated_leave->total() / 2;

                $accumulated_leave->sick_leave = $credit;

                $accumulated_leave->vacation_leave = $credit;
            }

            $accumulated_leave->save();

        }

        $utility->save();
    }

}

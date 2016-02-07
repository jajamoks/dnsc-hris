<?php

namespace DNSCHumanResource\HumanResource\Services;

use DNSCHumanResource\HumanResource\Repositories\RegularLeaveRepository;

class RegularLeaveService
{

    protected $leave;

    public function __construct(RegularLeaveRepository $leave)
    {
        $this->leave = $leave;
    }

    public function approve($leave)
    {
        switch ($leave->status) {
            case 'filed':
                $leave->status = 'recommended';
                break;
            case 'recommended':
                $leave->status = 'approved';
                break;
            case 'approved':
                $leave->status = 'certified';
                $this->lessCredit($leave);
                break;
        }
        $leave->save();
        return $leave;
    }

    public function reject($request, $leave)
    {
        switch ($leave->status) {
            case 'filed':
                $leave->status = 'unrecommended';
                break;
            case 'recommended':
                $leave->status = 'disapproved';
                break;
            case 'approved':
                $leave->status = 'uncertified';
        }
        $leave->remarks = $request->remarks;
        $leave->save();
        return $leave;
    }

    protected function lessCredit($leave)
    {
        $employee = $leave->employee;

        $daysApplied = $leave->working_days_applied;

        $accumulatedLeave = $employee->accumulated_leave;

        $leaveCredits = $employee->leave_credit;

        if ($leaveCredits->hasAvailableForceLeaveCredits()) {
            if ($leaveCredits->force_leave >= $daysApplied) {
                $leaveCredits->force_leave = $leaveCredits->force_leave - $daysApplied;
                return $leaveCredits->save();
            } else {
                $daysApplied = $daysApplied - $leaveCredits->force_leave;

                $leaveCredits->force_leave = 0;
            }
            $leaveCredits->save();
        }

        $accumulatedLeave->{$leave->leave_type . '_leave'} = $accumulatedLeave->{$leave->leave_type . '_leave'}-$daysApplied;
        return $accumulatedLeave->save();
    }

}

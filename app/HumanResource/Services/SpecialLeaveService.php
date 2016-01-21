<?php

namespace DNSCHumanResource\HumanResource\Services;

class SpecialLeaveService
{

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
                $this->decrementSpecialLeaveCredits($leave->employee);
                break;
        }
        $leave->save();
        return $leave;
    }

    public function reject($leave)
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
                break;
        }
        $leave->save();
        return $leave;
    }

    protected function decrementSpecialLeaveCredits($employee)
    {
        $specialLeaveCredit                    = $employee->leave_credit->special_leave;
        $employee->leave_credit->special_leave = --$specialLeaveCredit;
        $employee->leave_credit->save();
    }

}

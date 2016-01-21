<?php namespace DNSCHumanResource\HumanResource\Contracts;

use DNSCHumanResource\Models\Employee;

interface RegularLeave
{
    // Get all regular leaves with employee relationship

    public function get($id);

    // Get all approved regular leaves

    public function approvedLeaves();

    // Filter and get all approved vacation leaves

    public function approvedVacationLeaves();

    // Filter and get all approved sick leaves

    public function approvedSickLeaves();

    // Get all filed leaves need to be approved by each recommending approval

    public function filedLeave(Employee $employee);

    // Get all leaves in each employee

    public function employeeLeave(Employee $employee);

    // Get all pending leaves

    public function pendingLeave();

    // Get all authenticated user filed leaves

    public function myLeave();

    // Get authenticated user's recommending approval when approving filed leaves

    public function getRegularLeaveRecommendingApproval();

    // Get authenticated user's certified by when approving filed leaves

    public function getRegularLeaveCertifiedBy();
}

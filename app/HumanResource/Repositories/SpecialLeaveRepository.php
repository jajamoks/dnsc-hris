<?php namespace DNSCHumanResource\HumanResource\Repositories;

use DNSCHumanResource\HumanResource\Contracts\SpecialLeave as SpecialLeaveInterface;
use HumanResource;

class SpecialLeaveRepository implements SpecialLeaveInterface
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    public function getProcessingPersonnel()
    {

    }

    public function getRecommendingApproval()
    {
        if ($this->user->isAdmin() or $this->user->isDepartmentHead()) {
            return HumanResource::president();
        }
        return HumanResource::departmentHead();
    }

    public function getCertifiedBy()
    {
        if ($this->user->isDepartmentHead() or $this->user->isUser()) {
            return HumanResource::admin();
        }
        return null;
    }

}

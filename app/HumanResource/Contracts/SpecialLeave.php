<?php

namespace DNSCHumanResource\HumanResource\Contracts;

interface SpecialLeave
{

    // Get employee special leave processing personnel

    public function getProcessingPersonnel();

    // Get employee special leave recommending approval

    public function getRecommendingApproval();

    // Get employee special leave certified by

    public function getCertifiedBy();

}

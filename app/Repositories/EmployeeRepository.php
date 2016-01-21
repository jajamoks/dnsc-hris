<?php

namespace DNSCHumanResource\Repositories;

use DNSCHumanResource\Models\User;

class EmployeeRepository
{

    public function forUser(User $user)
    {
        return $user->employee()->with('employee_address',
            'employee_child', 'employee_civil_services', 'employee_educations', 'employee_non_academics', 'employee_organizations',
            'employee_parents', 'employee_reference', 'employee_skills', 'employee_spouse', 'employee_training_programs',
            'employee_voluntary_works', 'employee_work_experiences', 'trainings', 'approval_heirarchy');
    }

}

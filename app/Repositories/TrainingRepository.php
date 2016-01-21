<?php

namespace DNSCHumanResource\Repositories;

use DNSCHumanResource\Models\Employee;

class TrainingRepository
{

    public function forEmployee(Employee $employee)
    {
        $trainings = $employee->trainings->merge($employee->employee_training_programs);
        return $trainings;
    }

    public function forEmployeeIncludedInPds(Employee $employee)
    {
        return $employee->trainings()->includedInPds()->finishedTrainings()->get()->merge($employee->employee_training_programs);
    }

}

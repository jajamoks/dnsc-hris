<?php namespace DNSCHumanResource\HumanResource\Services;

use DNSCHumanResource\Models\Employee;
use Image;

class EmployeeService
{

    protected $employee;

    public function setEmployee(Employee $employee)
    {
        $this->employee = $employee;
    }

    public function getEmployee($request)
    {
        return [
            'surname'                => ucfirst($request->employee_surname),
            'first_name'             => ucfirst($request->employee_firstname),
            'middle_name'            => ucfirst($request->employee_middlename),
            'name_extension'         => ucfirst($request->employee_name_extension),
            'birthday'               => $request->employee_birthday,
            'birthplace'             => ucfirst($request->employee_birthplace),
            'sex'                    => $request->employee_sex,
            'civil_status'           => $request->employee_civil_status,
            'citizenship'            => ucfirst($request->employee_citizenship),
            'height'                 => $request->employee_height,
            'weight'                 => $request->employee_weight,
            'blood_type'             => $request->employee_blood_type,
            'gsis_id'                => $request->employee_gsis_id,
            'pagibig_id'             => $request->employee_pagibig_id,
            'philhealth'             => $request->employee_philhealth_id,
            'sss_id'                 => $request->employee_sss_id,
            'cellphone_number'       => $request->employee_cellphone_number,
            'agency_employee_number' => $request->agency_employee_number,
            'tin'                    => $request->employee_tin_number,
            'photo'                  => $this->getPhoto($request),
        ];
    }

    public function getEmployeeAddress($request)
    {
        return [[
            'employee_address_id' => $request->residential_employee_address_id,
            'address'             => ucfirst($request->employee_residential_address),
            'zip_code'            => $request->residential_zip_code,
            'telephone_number'    => $request->residential_telephone_number,
            'address_type'        => 'residential',
        ], [
            'employee_address_id' => $request->permanent_employee_address_id,
            'address'             => ucfirst($request->employee_permanent_address),
            'zip_code'            => $request->permanent_zip_code,
            'telephone_number'    => $request->permanent_telephone_number,
            'address_type'        => 'permanent',
        ]];
    }

    public function getEmployeeChildren($request)
    {
        $children = collect();
        if ($request->child_name) {
            foreach ($request->child_name as $value => $child) {
                $child = [
                    'id'       => $request->employee_child_id[$value],
                    'name'     => ucfirst($child),
                    'birthday' => $request->child_birthday[$value],
                ];
                if (!$request->validateChild($child)->fails()) {
                    $children->push($child);
                }
            }
        } else {
            return null;
        }
        return $children;
    }

    public function getEmployeeEducation($request)
    {
        $employee_educations = collect();
        if ($request->school) {
            foreach ($request->school as $key => $value) {
                $education = [
                    'id'              => $request->education_id[$key],
                    'level'           => $request->educational_level[$key],
                    'school'          => $request->school[$key],
                    'degree_course'   => $request->degree_course[$key],
                    'year_graduated'  => $request->year_graduated[$key],
                    'highest_level'   => $request->highest_level[$key],
                    'start'           => $request->education_start[$key],
                    'end'             => $request->education_end[$key],
                    'academic_honors' => $request->academic_honors[$key],
                ];
                if (!$request->validateEmployeeEducation($education)->fails()) {
                    $employee_educations->push($education);
                }
            }
            return $employee_educations;
        }
        return null;
    }

    public function getEmployeeCivilService($request)
    {
        $employee_civil_service = collect();
        if ($request->cs_career_service) {
            foreach ($request->cs_career_service as $value => $civil_service) {
                $civil_service_eligibility = [
                    'id'                => $request->employee_civil_service_id[$value],
                    'career_service'    => ucfirst($request->cs_career_service[$value]),
                    'rating'            => $request->cs_rating[$value],
                    'examination_date'  => $request->cs_examination_date[$value],
                    'examination_place' => $request->cs_examination_place[$value],
                    'license_number'    => $request->cs_license_number[$value],
                    'release_date'      => $request->cs_release_date[$value],
                ];
                if (!$request->validateCivilServiceEligibility($civil_service_eligibility)->fails()) {
                    $employee_civil_service->push($civil_service_eligibility);
                }
            }
            return $employee_civil_service;
        }
        return null;
    }

    public function getEmployeeNonAcademic($request)
    {
        $employee_non_academics = collect();
        if ($request->employee_non_academic) {
            foreach ($request->employee_non_academic as $value => $employee_non_academic) {
                $non_academic = [
                    'id'   => $request->non_academic_id[$value],
                    'name' => ucfirst($employee_non_academic),
                ];
                if (!$request->validateNonAcademic($non_academic)->fails()) {
                    $employee_non_academics->push($non_academic);
                }
            }
            return $employee_non_academics;
        }
        return null;
    }

    public function getEmployeeOrganization($request)
    {
        $employee_organizations = collect();
        if ($request->employee_organization) {
            foreach ($request->employee_organization as $key => $employee_organization) {
                $organization = [
                    'id'   => $request->organization_id[$key],
                    'name' => ucfirst($employee_organization),
                ];
                if (!$request->validateOrganizations($organization)->fails()) {
                    $employee_organizations->push($organization);
                }
            }
            return $employee_organizations;
        }
        return null;
    }

    public function getEmployeeParents($request)
    {
        $collection = collect();
        $parents    = [[
            'employee_parent_id' => $request->father_id,
            'last_name'          => ucfirst($request->father_surname),
            'first_name'         => ucfirst($request->father_firstname),
            'middle_name'        => ucfirst($request->father_middlename),
            'relationship'       => 'father',
        ], [
            'employee_parent_id' => $request->mother_id,
            'last_name'          => ucfirst($request->mother_surname),
            'first_name'         => ucfirst($request->mother_firstname),
            'middle_name'        => ucfirst($request->mother_middlename),
            'relationship'       => 'mother',
        ]];
        foreach ($parents as $parent) {
            if (!$request->validateParent($parent)->fails()) {
                $collection->push($parent);
            }
        }
        return $collection;
    }

    public function getEmployeeSkill($request)
    {
        $employee_skills = collect();
        if ($request->employee_skills_hobby) {
            foreach ($request->employee_skills_hobby as $value => $employee_skill) {
                $skill = [
                    'id'    => $request->skills_id[$value],
                    'skill' => ucfirst($employee_skill),
                ];
                if (!$request->validateSkill($skill)->fails()) {
                    $employee_skills->push($skill);
                }
            }
            return $employee_skills;
        }
        return null;
    }

    public function getEmployeeSpouse($request)
    {
        return [
            'last_name'              => $request->spouse_surname,
            'first_name'             => $request->spouse_firstname,
            'middle_name'            => $request->spouse_middlename,
            'occupation'             => $request->spouse_occupation,
            'employer_business_name' => $request->spouse_employer_business_name,
            'business_address'       => $request->spouse_employer_business_address,
            'telephone_number'       => $request->spouse_business_telephone_number,
        ];
    }

    public function getEmployeeTrainingPrograms($request)
    {
        $employee_training_programs = collect();
        if ($request->training_title) {
            foreach ($request->training_title as $value => $training) {
                $training = [
                    'id'              => $request->training_id[$value],
                    'title'           => ucfirst($request->training_title[$value]),
                    'start'           => $request->training_start_date[$value],
                    'end'             => $request->training_end_date[$value],
                    'number_of_hours' => $request->training_hours[$value],
                    'sponsored_by'    => ucfirst($request->training_sponsor[$value]),
                ];

                if (!$request->validateTrainingProgram($training)->fails()) {
                    $employee_training_programs->push($training);
                }
            }
            return $employee_training_programs;
        }
        return null;
    }

    public function getEmployeeVoluntaryWork($request)
    {
        $employee_voluntary_work = collect();
        if ($request->voluntary_work_organization_name) {
            foreach ($request->voluntary_work_organization_name as $value => $voluntary_work) {
                $voluntary_work = [
                    'id'                   => $request->employee_voluntary_work_id[$value],
                    'organization_name'    => ucfirst($request->voluntary_work_organization_name[$value]),
                    'organization_address' => ucfirst($request->voluntary_work_address[$value]),
                    'date_from'            => $request->voluntary_work_start_date[$value],
                    'date_to'              => $request->voluntary_work_end_date[$value],
                    'number_of_hours'      => $request->voluntary_work_hours[$value],
                    'position'             => ucfirst($request->voluntary_work_position[$value]),
                ];
                if (!$request->validateVoluntaryWork($voluntary_work)->fails()) {
                    $employee_voluntary_work->push($voluntary_work);
                }
            }
            return $employee_voluntary_work;
        }
        return null;
    }

    public function getEmployeeWorkExperience($request)
    {
        $employee_work_experience = collect();
        if ($request->work_position_title) {
            foreach ($request->work_position_title as $value => $work_experience) {
                $work = [
                    'id'                    => $request->work_experience_id[$value],
                    'date_from'             => $request->work_start_date[$value],
                    'date_to'               => $request->work_end_date[$value],
                    'position_title'        => ucfirst($request->work_position_title[$value]),
                    'company'               => ucfirst($request->work_company[$value]),
                    'monthly_salary'        => $request->work_monthly_salary[$value],
                    'salary_grade'          => $request->work_salary_grade[$value],
                    'status_of_appointment' => ucfirst($request->work_status_of_appointment[$value]),
                    'government_service'    => $request->work_government_service[$value],
                ];
                if (!$request->validateWorkExperience($work)->fails()) {
                    $employee_work_experience->push($work);
                }
            }
            return $employee_work_experience;
        }
        return null;
    }

    public function getPhoto($request)
    {
        $photo_name = str_random(32) . '.jpg';
        if ($request->hasFile('employee_photo')) {
            $photo = Image::make($request->file('employee_photo'));
            $photo->fit(500, 500);
            if ($request->isMethod('post')) {
                $username = auth()->user()->username;
            } else {
                $username = $this->employee->user->username;
            }
            $path = public_path('uploads/');
            $photo->save($path . $photo_name);
        } elseif ($request->isMethod('put')) {
            $photo_name = $this->employee->photo;
        } else {
            return null;
        }
        return $photo_name;
    }

}

<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Repositories\TrainingRepository;
use Excel;

class WritePersonalDataSheet extends FormWriter
{

    protected $employee;

    protected $trainingRepository;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Employee $employee)
    {
        $this->employee = $employee;
    }

    /**
     * Write the form.
     *
     * @return void
     */

    public function handle()
    {
        $this->trainingRepository = new TrainingRepository;
        $this->writePersonalDataSheet();
    }

    protected function writePersonalDataSheet()
    {
        $path = storage_path('app/templates/PersonalDataSheet.xlsx');

        $pds_file = Excel::load($path, function ($reader) {
            $reader->file         = studly_case($this->employee->fullName()) . '.xlsx';
            $this->employee->file = $reader->file;
            $this->employee->save();

            $sheet = $reader->sheet('C1');
            $sheet->protect('password');

            //Personal Information
            $sheet->setCellValue('C7', strtoupper($this->employee->surname));
            $sheet->setCellValue('C8', strtoupper($this->employee->first_name));
            $sheet->setCellValue('C9', strtoupper($this->employee->middle_name));
            $sheet->setCellValue('N9', strtoupper($this->employee->name_extension));
            $sheet->setCellValue('E10', date('M d Y', strtotime($this->employee->birthday)));
            $sheet->setCellValue('C11', strtoupper($this->employee->birthplace));
            $sheet->setCellValue('D13', strtoupper($this->employee->civil_status));
            $sheet->setCellValue('C16', strtoupper($this->employee->citizenship));
            $sheet->setCellValue('C17', strtoupper($this->employee->height));
            $sheet->setCellValue('C18', strtoupper($this->employee->weight));
            $sheet->setCellValue('C19', strtoupper($this->employee->blood_type));
            $sheet->setCellValue('C20', $this->employee->gsis_id);
            $sheet->setCellValue('C21', $this->employee->pagibig_id);
            $sheet->setCellValue('C22', $this->employee->philhealth_id);
            $sheet->setCellValue('C23', $this->employee->sss_id);
            $sheet->setCellValue('I10', strtoupper($this->employee->employee_address()->residential()->address));
            $sheet->setCellValue('I13', $this->employee->employee_address()->residential()->zip_code);
            $sheet->setCellValue('I14', $this->employee->employee_address()->residential()->telephone_number);
            $sheet->setCellValue('I15', strtoupper($this->employee->employee_address()->permanent()->address));
            $sheet->setCellValue('I18', $this->employee->employee_address()->permanent()->zip_code);
            $sheet->setCellValue('I19', $this->employee->employee_address()->permanent()->telephone_number);
            $sheet->setCellValue('I20', $this->employee->user->email);
            $sheet->setCellValue('I21', $this->employee->cellphone_number);
            $sheet->setCellValue('I22', $this->employee->agency_employee_number);
            $sheet->setCellValue('I23', $this->employee->tin);

            //Family Background
            if ($this->employee->employee_spouse) {
                $sheet->setCellValue('C25', strtoupper($this->employee->employee_spouse->last_name));
                $sheet->setCellValue('C26', strtoupper($this->employee->employee_spouse->first_name));
                $sheet->setCellValue('C27', strtoupper($this->employee->employee_spouse->middle_name));
                $sheet->setCellValue('C28', strtoupper($this->employee->employee_spouse->occupation));
                $sheet->setCellValue('C29', strtoupper($this->employee->employee_spouse->employer_business_name));
                $sheet->setCellValue('C30', strtoupper($this->employee->employee_spouse->business_address));
                $sheet->setCellValue('C31', $this->employee->employee_spouse->telephone_number);
            }
            if ($this->employee->employee_child) {
                $row_num = 26;
                foreach ($this->employee->employee_child as $child_name) {
                    $sheet->setCellValue('H' . $row_num, strtoupper($child_name->name));
                    $sheet->setCellValue('M' . $row_num, strtoupper(date('m/d/Y', strtotime($child_name->birthday))));
                    ++$row_num;
                }
            }

            $sheet->setCellValue('D33', strtoupper($this->employee->employee_parents()->father()->last_name));
            $sheet->setCellValue('D34', strtoupper($this->employee->employee_parents()->father()->first_name));
            $sheet->setCellValue('D35', strtoupper($this->employee->employee_parents()->father()->middle_name));
            $sheet->setCellValue('D37', strtoupper($this->employee->employee_parents()->mother()->last_name));
            $sheet->setCellValue('D38', strtoupper($this->employee->employee_parents()->mother()->first_name));
            $sheet->setCellValue('D39', strtoupper($this->employee->employee_parents()->mother()->middle_name));

            $employeeEducations = $this->employee->employee_educations;
            if ($employeeEducations) {
                $educations = collect();
                $educations->push($this->employee->employee_educations()->elementary()->first());
                $educations->push($this->employee->employee_educations()->secondary()->first());
                $educations->push($this->employee->employee_educations()->vocational()->first());
                foreach ($this->employee->employee_educations()->college()->get() as $college) {
                    $educations->push($college);
                }
                $this->writeEducation($sheet, $educations);
            }

            $sheet = $reader->sheet('C2');
            $sheet->protect('password');

            if ($this->employee->employee_civil_services) {
                $row = 5;
                foreach ($this->employee->employee_civil_services->take(5) as $civil_service) {
                    $sheet->setCellValue('A' . $row, strtoupper($civil_service->career_service));
                    $sheet->setCellValue('F' . $row, strtoupper($civil_service->rating));
                    $sheet->setCellValue('G' . $row, date('M d Y', strtotime($civil_service->examination_date)));
                    $sheet->setCellValue('I' . $row, strtoupper($civil_service->examination_place));
                    $sheet->setCellValue('L' . $row, $civil_service->license_number);
                    $sheet->setCellValue('M' . $row, date('M d Y', strtotime($civil_service->release_date)));
                    ++$row;
                }
            }

            if ($this->employee->employee_work_experiences) {
                $row = 17;
                foreach ($this->employee->employee_work_experiences->take(20) as $work_experience) {
                    $sheet->setCellValue('A' . $row, date('m/d/Y', strtotime($work_experience->date_from)));
                    $sheet->setCellValue('C' . $row, date('m/d/Y', strtotime($work_experience->date_to)));
                    $sheet->setCellValue('D' . $row, strtoupper($work_experience->position_title));
                    $sheet->setCellValue('G' . $row, strtoupper($work_experience->company));
                    $sheet->setCellValue('J' . $row, strtoupper($work_experience->monthly_salary));
                    $sheet->setCellValue('K' . $row, strtoupper($work_experience->salary_grade));
                    $sheet->setCellValue('L' . $row, strtoupper($work_experience->status_of_appointment));
                    $sheet->setCellValue('M' . $row, strtoupper($work_experience->government_service));
                    ++$row;
                }
            }

            $sheet = $reader->sheet('C3');
            $sheet->protect('password');
            if ($this->employee->employee_voluntary_work) {
                $row = 6;
                foreach ($this->employee->employee_voluntary_work->take(5) as $voluntary_work) {
                    $sheet->setCellValue('A' . $row, $voluntary_work->organization_name . '/ ' . $voluntary_work->organization_address);
                    $sheet->setCellValue('E' . $row, date('m/d/Y', strtotime($voluntary_work->date_from)));
                    $sheet->setCellValue('F' . $row, date('m/d/Y', strtotime($voluntary_work->date_to)));
                    $sheet->setCellValue('G' . $row, $voluntary_work->number_of_hours);
                    $sheet->setCellValue('H' . $row, $voluntary_work->position);
                    ++$row;
                }
            }

            $trainings = $this->trainingRepository->forEmployeeIncludedInPds($this->employee);

            if ($trainings) {
                $row = 16;
                foreach ($trainings as $training) {
                    $sheet->setCellValue('A' . $row, strtoupper($training->title));
                    $sheet->setCellValue('E' . $row, strtoupper(date('m/d/Y', strtotime($training->start))));
                    $sheet->setCellValue('F' . $row, strtoupper(date('m/d/Y', strtotime($training->end))));
                    $sheet->setCellValue('G' . $row, strtoupper($training->number_of_hours));
                    $sheet->setCellValue('H' . $row, strtoupper($training->sponsored_by));
                    ++$row;
                }
            }

            if ($this->employee->employee_skills) {
                $row = 34;
                foreach ($this->employee->employee_skills->take(5) as $skill) {
                    $sheet->setCellValue('A' . $row, strtoupper($skill->skill));
                    ++$row;
                }
            }

            if ($this->employee->employee_non_academics) {
                $row = 34;
                foreach ($this->employee->employee_non_academics->take(5) as $non_academic) {
                    $sheet->setCellValue('C' . $row, strtoupper($non_academic->name));
                    ++$row;
                }
            }

            if ($this->employee->employee_organizations) {
                $row = 34;
                foreach ($this->employee->employee_organizations->take(5) as $organization) {
                    $sheet->setCellValue('H' . $row, strtoupper($organization->name));
                    ++$row;
                }
            }

            $sheet = $reader->sheet('C4');
            $sheet->protect('password');

            $sheet->setCellValue('D54', date('M d, Y', strtotime($this->employee->created_at)));

            if ($this->employee->user->signature) {
                excel_attach_image([
                    'path'        => $this->employee->user->signature,
                    'coordinates' => 'D48',
                    'worksheet'   => $reader->sheet('C4'),
                ]);
            }

            if (!$this->employee->noPhoto()) {
                excel_attach_image([
                    'path'        => public_path('uploads/' . $this->employee->photo),
                    'coordinates' => 'G40',
                    'worksheet'   => $reader->sheet('C4'),
                    'width'       => 160,
                ]);
            }

        });

        $pds_file->export('xlsx');
        // If error occurs, refer to Writer\Excel2007.php line 235 or later
    }

    protected function writeEducation($sheet, $educations)
    {
        $index = 44;
        foreach ($educations as $key => $education) {
            if ($education) {
                $sheet->setCellValue('C' . $index, strtoupper($education->school));
                $sheet->setCellValue('F' . $index, strtoupper($education->degree_course));
                $sheet->setCellValue('H' . $index, strtoupper($education->year_graduated));
                $sheet->setCellValue('I' . $index, strtoupper($education->highest_level));
                $sheet->setCellValue('L' . $index, strtoupper($education->start));
                $sheet->setCellValue('M' . $index, strtoupper($education->end));
                $sheet->setCellValue('N' . $index, strtoupper($education->academic_honors));
            }
            ++$index;
        }
    }
}

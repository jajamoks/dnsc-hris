<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use DNSCHumanResource\Models\EmployeeSpecialLeave;
use Excel;

class WriteSpecialLeaveForm extends FormWriter
{

    protected $leave;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(EmployeeSpecialLeave $leave)
    {
        $this->leave = $leave;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $this->writeForm($this->leave);
    }

    protected function writeForm($leave)
    {
        $employee = $leave->employee;
        $not_found = false;
        $path = 'files/SpecialLeaveForms/' . $leave->file;

        if (!file_exists($path) || null === $leave->file) {
            $path = storage_path('app/templates/SpecialLeaveForm.xlsx');
            $not_found = true;
        }
        $leave_form = Excel::load($path, function ($reader) use ($leave, $employee, $not_found) {

            $sheet = $reader->sheet('Sheet1');
            $sheet->protect('password');

            $sheet->setCellValue('A6', $employee->first_name);
            $sheet->setCellValue('E6', $employee->middle_name);
            $sheet->setCellValue('I6', $employee->surname);
            $sheet->setCellValue('A8', $employee->user->department->code); // Staff / Division
            $sheet->setCellValue('E8', $employee->user->positions->first()->name); // Position

            if (!$leave->file_path) {
                $reader->file = $leave->fileName() . '.xlsx';
                $leave->file = $reader->file;
                $leave->save();

                $sheet->setCellValue('I8', date('M d Y', strtotime($leave->created_at)));

                // Type of leave
                $sheet->setCellValue('B13', ($leave->type == 'personal milestone') ? utf8_encode('P') : null);
                $sheet->setCellValue('F13', ($leave->type == 'filial obligation') ? utf8_encode('P') : null);
                $sheet->setCellValue('J13', ($leave->type == 'personal transaction') ? utf8_encode('P') : null);
                $sheet->setCellValue('B17', ($leave->type == 'parental obligations') ? utf8_encode('P') : null);
                $sheet->setCellValue('F17', ($leave->type == 'domestic emergencies') ? utf8_encode('P') : null);
                $sheet->setCellValue('J17', ($leave->type == 'calamity') ? utf8_encode('P') : null);

                $sheet->setCellValue('A21', $leave->number_of_days);
                $sheet->setCellValue('E21', date('M d Y', strtotime($leave->date_from)) . ' - ' . date('M d Y', strtotime($leave->date_to)));

                // Action on application

                $sheet->setCellValue('A24', $employee->leave_credit->special_leave == 3 ? utf8_encode('P') : null);
                $sheet->setCellValue('A25', $employee->leave_credit->special_leave == 2 ? utf8_encode('P') : null);
                $sheet->setCellValue('A26', $employee->leave_credit->special_leave == 1 ? utf8_encode('P') : null);

                // Recommending Approval
                if ($leave->recommending_approval) {
                    $sheet->setCellValue('I28', strtoupper($leave->recommending_approval->full_name));
                    $sheet->setCellValue('I31', $leave->recommending_approval->user->position_title);
                }

                // Approved by
                $sheet->setCellValue('A37', strtoupper($leave->approved_by->full_name));

                // Certified by
                $sheet->setCellValue('F28', strtoupper($leave->certified_by->full_name));
            } else {
                switch ($leave->status) {
                    case 'disapproved':case 'rejected':
                        $sheet->setCellValue('I34', $leave->remarks);
                }

                if ($leave->isStatus('certified')) {
                    if ($leave->employee->user->signature_path) {
                        excel_attach_image([
                            'name' => $leave->employee->full_name,
                            'path' => $leave->employee->user->signature_path,
                            'coordinates' => 'I21',
                            'worksheet' => $reader->sheet('Sheet1'),
                        ]);
                    }
                    if ($leave->recommending_approval && $leave->recommending_approval->user->signature_path) {
                        excel_attach_image([
                            'name' => $leave->recommending_approval->full_name,
                            'path' => $leave->recommending_approval->user->signature_path,
                            'coordinates' => 'I25',
                            'worksheet' => $reader->sheet('Sheet1'),
                        ]);
                    }
                    if ($leave->approved_by && $leave->approved_by->user->signature_path) {
                        excel_attach_image([
                            'name' => $leave->approved_by->full_name,
                            'path' => $leave->approved_by->user->signature_path,
                            'coordinates' => 'E35',
                            'worksheet' => $reader->sheet('Sheet1'),
                        ]);
                    }
                    if ($leave->certified_by && $leave->certified_by->user->signature_path) {
                        excel_attach_image([
                            'name' => $leave->certified_by->full_name,
                            'path' => $leave->certified_by->user->signature_path,
                            'coordinates' => 'F25',
                            'worksheet' => $reader->sheet('Sheet1'),
                        ]);
                    }
                }
            }
        });

        return $leave_form->store('xlsx', 'files/SpecialLeaveForms', true);
    }
}

<?php

namespace DNSCHumanResource\FormWriters;

use Carbon\Carbon as Carbon;
use DNSCHumanResource\FormWriters\FormWriter;
use DNSCHumanResource\Models\EmployeeLeave;
use Excel;

class WriteRegularLeaveForm extends FormWriter
{

    protected $leave;
    /**
     * Create a new form instance.
     *
     * @return void
     */
    public function __construct(EmployeeLeave $leave)
    {
        $this->leave = $leave;
    }

    /**
     * Write the form.
     *
     * @return void
     */
    public function handle()
    {
        $this->writeRegularLeaveForm();
    }

    protected function writeRegularLeaveForm()
    {
        $leave    = $this->leave;
        $employee = $this->leave->employee;

        $path = $leave->file_path;
        if (!$path) {
            $path = storage_path('app/templates/LeaveRequestForm.xlsx');
        }

        $form = Excel::load($path, function ($reader) use ($employee) {
            $sheet = $reader->sheet('Sheet1');
            $sheet->protect('password');

            if (!$this->leave->file_path) {
                $reader->file      = $this->leave->fileName() . '.xlsx';
                $this->leave->file = $reader->file;
                $this->leave->save();

                $sheet->setCellValue('D5', $employee->fullName());
                $sheet->setCellValue('D7', $employee->user->positions->first()->name);
                $sheet->setCellValue('D9', 33000);
                $sheet->setCellValue('D11', $employee->user->department->code);
                $sheet->setCellValue('D13', date('M d, Y', strtotime($this->leave->created_at)));
                $sheet->setCellValue('E15', $this->leave->working_days_applied . ' days');
                $sheet->setCellValue('D17', date('M d, Y', strtotime($this->leave->start_date)) . ' - ' . date('M d, Y', strtotime($this->leave->end_date)));

                //Commutation
                $sheet->setCellValue('B21', $this->leave->commutation == 'requested' ? utf8_encode('P') : null);
                $sheet->setCellValue('E21', $this->leave->commutation == 'not requested' ? utf8_encode('P') : null);

                //Type of leave
                $sheet->setCellValue('L3', $this->leave->leave_type == 'vacation' ? utf8_encode('P') : null);
                $sheet->setCellValue('L7', $this->leave->leave_type == 'sick' ? utf8_encode('P') : null);
                $sheet->setCellValue('L11', $this->leave->leave_type == 'maternity' ? utf8_encode('P') : null);

                //Additional info
                $sheet->setCellValue('O3', $this->leave->additional_info == 'within the philippines' ? utf8_encode('P') : null);
                $sheet->setCellValue('O5', $this->leave->additional_info == 'abroad' ? utf8_encode('P') : null);
                $sheet->setCellValue('O7', $this->leave->additional_info == 'out patient' ? utf8_encode('P') : null);
                $sheet->setCellValue('O9', $this->leave->additional_info == 'in hospital' ? utf8_encode('P') : null);

                $sheet->setCellValue('J27', strtoupper($this->leave->recommending_approval ? $this->leave->recommending_approval->full_name : null));
                $sheet->setCellValue('J35', strtoupper($this->leave->approved_by ? $this->leave->approved_by->full_name : null));
                $sheet->setCellValue('A35', strtoupper($this->leave->certified_by ? $this->leave->certified_by->full_name : null));

                // Leave Credits
                $sheet->setCellValue('A26', date('M d, Y', strtotime(Carbon::now())));
                $sheet->setCellValue('D26', $employee->accumulated_leave->vacation_leave);
                $sheet->setCellValue('E26', $employee->accumulated_leave->sick_leave);
            } else {

                //Action on application

                switch ($this->leave->status) {
                    case 'recommended':
                        $sheet->setCellValue('L21', utf8_encode('P'));
                        break;
                    case 'unrecommended':
                        $sheet->setCellValue('L23', utf8_encode('P'));
                        $sheet->setCellValue('T23', $this->leave->remarks);
                        break;
                    case 'approved':
                        $sheet->setCellValue('L29', utf8_encode('P'));
                        break;
                    case 'disapproved':
                        $sheet->setCellValue('Q29', utf8_encode('P'));
                        // $sheet->setCellValue('T23', $this->leave->remarks);
                        break;
                }

                // Attach signature
                $this->attachSignature($reader);
            }

            // Less
            if ($this->leave->isLeaveType('vacation')) {
                $sheet->setCellValue('D27', $this->leave->working_days_applied);
            } else {
                $sheet->setCellValue('E27', $this->leave->working_days_applied);
            }
        });

        return $form->store('xlsx', public_path('files/RegularLeaveForms'), true);
    }

    public function attachSignature($reader)
    {
        if ($this->leave->isStatus('certified')) {
            if ($this->leave->recommending_approval && $this->leave->recommending_approval->user->signature) {
                excel_attach_image([
                    'name'        => $this->leave->recommending_approval->full_name,
                    'path'        => $this->leave->recommending_approval->user->signature,
                    'coordinates' => 'J25',
                    'worksheet'   => $reader->sheet('Sheet1'),
                ]);
            }
            if ($this->leave->approved_by && $this->leave->approved_by->user->signature) {
                excel_attach_image([
                    'name'        => $this->leave->approved_by->full_name,
                    'path'        => $this->leave->approved_by->user->signature,
                    'coordinates' => 'J33',
                    'worksheet'   => $reader->sheet('Sheet1'),
                ]);
            }
            if ($this->leave->certified_by && $this->leave->certified_by->user->signature) {
                excel_attach_image([
                    'name'        => $this->leave->certified_by->full_name,
                    'path'        => $this->leave->certified_by->user->signature,
                    'coordinates' => 'A33',
                    'worksheet'   => $reader->sheet('Sheet1'),
                ]);
            }
            return true;
        }
        return false;
    }
}

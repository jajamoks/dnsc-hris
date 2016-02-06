<?php

namespace DNSCHumanResource\Formwriters;

use DNSCHumanResource\Formwriters\Formwriter;
use Excel;

class WriteEmployeeRegularLeaveSummary extends Formwriter
{

    public $leaves;

    public function __construct($leaves)
    {
        $this->leaves = $leaves;
    }

    public function handle()
    {
        $leaves = $this->leaves;

        $path = storage_path('app/templates/EmployeeRegularLeaveSummary.xlsx');
        Excel::load($path, function ($excel) use ($leaves) {

            $sheet = $excel->sheet('Sheet1');
            $index = 11;

            $sheet->setCellValue('B8', $this->leaves->first()->employee->full_name);

            foreach ($leaves as $leave) {
                $sheet->appendRow($index, [
                    date('M d, Y', strtotime($leave->created_at)),
                    $leave->working_days_applied,
                    strtoupper($leave->commutation),
                    date('M d', strtotime($leave->start_date)) . ' - ' . date('M d, Y', strtotime($leave->end_date)),
                    strtoupper($leave->leave_type),
                ]);
                ++$index;
            }
        })->export('xlsx');
    }

}

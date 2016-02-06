<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteEmployeeSpecialLeaveSummary extends FormWriter
{

    public $leaves;

    public function __construct($leaves)
    {
        $this->leaves = $leaves;
    }

    public function handle()
    {
        $leaves = $this->leaves;

        $path = storage_path('app/templates/EmployeeSpecialLeaveSummary.xlsx');
        Excel::load($path, function ($excel) use ($leaves) {

            $sheet = $excel->sheet('Sheet1');
            $index = 11;

            $sheet->setCellValue('B8', $this->leaves->first()->employee->full_name);

            foreach ($leaves as $leave) {
                $sheet->appendRow($index, [
                    date('M d, Y', strtotime($leave->created_at)),
                    $leave->number_of_days,
                    date('M d', strtotime($leave->date_from)) . ' - ' . date('M d, Y', strtotime($leave->date_to)),
                    strtoupper($leave->type),
                ]);
                ++$index;
            }
        })->export('xlsx');
    }

}

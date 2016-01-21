<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteRegularLeaveSummary extends FormWriter
{

    protected $leaves;
    /**
     * Create a new form instance.
     *
     * @return void
     */
    public function __construct($leaves)
    {
        $this->leaves = $leaves;
    }

    /**
     * Write the form.
     *
     * @return void
     */
    public function handle()
    {
        $leaves = $this->leaves;

        $path = storage_path('app/templates/RegularLeaveSummary.xlsx');
        Excel::load($path, function ($excel) use ($leaves) {

            $sheet = $excel->sheet('Sheet1');
            $index = 9;

            foreach ($leaves as $leave) {
                $sheet->appendRow($index, [
                    $leave->employee->fullName(),
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

<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteSpecialLeaveSummary extends FormWriter
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
        $file = storage_path('app/templates/SpecialLeaveSummary.xlsx');

        if (file_exists($file)) {
            $leaves = $this->leaves;

            $summary = Excel::load($file, function ($excel) use ($leaves) {
                $sheet = $excel->sheet('Sheet1');
                $index = 9;

                foreach ($leaves as $leave) {
                    $sheet->appendRow($index, [
                        $leave->employee->fullName(),
                        date('M d, Y', strtotime($leave->created_at)),
                        $leave->number_of_days,
                        date('M d, Y', strtotime($leave->date_from)) . '-' . date('M d, Y', strtotime($leave->date_to)),
                        ucfirst($leave->type),
                    ]);
                    ++$index;
                }
            });
            $summary->export('xlsx');
        }
    }
}

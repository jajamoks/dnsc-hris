<?php namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteEmployeeTravelOrderSummary extends FormWriter
{

    public $travels;

    public function __construct($travels)
    {
        $this->travels = $travels;
    }

    public function handle()
    {
        $travels = $this->travels;

        $path = storage_path('app/templates/EmployeeTravelOrderSummary.xlsx');
        Excel::load($path, function ($excel) {

            $sheet = $excel->sheet('Sheet1');
            $index = 11;

            $sheet->setCellValue('B8', $this->travels->first()->employee->full_name);

            foreach ($this->travels as $travel) {
                $sheet->appendRow($index, [
                    $travel->travel_order_number,
                    $travel->destination,
                    date('M d', strtotime($travel->date_from)) . ' - ' . date('M d, Y', strtotime($travel->date_to)),
                    strtoupper($travel->purpose),
                ]);
                ++$index;
            }
        })->export('xlsx');
    }

}

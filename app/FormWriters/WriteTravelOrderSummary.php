<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteTravelOrderSummary extends FormWriter
{

    protected $travels;
    /**
     * Create a new form instance.
     *
     * @return void
     */
    public function __construct($travels)
    {
        $this->travels = $travels;
    }

    /**
     * Write the form.
     *
     * @return void
     */
    public function handle()
    {
        $travels = $this->travels;

        $path = storage_path('app/templates/TravelOrderSummary.xlsx');

        Excel::load($path, function ($excel) use ($travels) {
            $sheet = $excel->sheet('Sheet1');
            $index = 9;

            foreach ($travels as $travel) {
                $sheet->appendRow($index, [
                    $travel->travel_order_number,
                    $travel->employee->fullName(),
                    $travel->destination,
                    date('M d', strtotime($travel->date_from)) . ' - ' . date('M d, Y', strtotime($travel->date_to)),
                    str_limit($travel->purpose, 40),
                ]);
                ++$index;
            }
        })->export('xlsx');
    }
}

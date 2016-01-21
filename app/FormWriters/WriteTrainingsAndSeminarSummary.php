<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteTrainingsAndSeminarSummary extends FormWriter
{

    public $trainings;

    public function __construct($trainings)
    {
        $this->trainings = $trainings;
    }

    public function handle()
    {
        $path = storage_path('app/templates/SummaryOfTrainingsAndSeminars.xlsx');

        Excel::load($path, function ($excel) {
            $sheet = $excel->sheet('Sheet1');
            $index = 9;

            foreach ($this->trainings as $event) {
                $sheet->appendRow($index, [
                    date('M d', strtotime($event->start)) . ' - ' . date('M d, Y', strtotime($event->end)),
                    $event->title,
                    $event->venue,
                ]);
                ++$index;
            }
        })->export('xlsx');
    }

}

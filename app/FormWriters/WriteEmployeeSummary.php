<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use Excel;

class WriteEmployeeSummary extends FormWriter
{

    public $users;

    public function __construct($users)
    {
        $this->users = $users;
    }

    public function handle()
    {

        $path = storage_path('app/templates/EmployeeListSummary.xlsx');

        Excel::load($path, function ($excel) {

            $sheet = $excel->sheet('Sheet1');
            $index = 9;

            foreach ($this->users as $user) {
                $sheet->appendRow($index, [
                    $user->username,
                    $user->display_name,
                    $user->position_title,
                    $user->department ? $user->department->code : 'No department',
                    ucfirst($user->status),
                ]);
                ++$index;
            }
        })->export('xlsx');

    }

}

<?php

namespace DNSCHumanResource\FormWriters;

use DNSCHumanResource\FormWriters\FormWriter;
use DNSCHumanResource\Models\TravelOrder;
use Excel;

class WriteTravelOrderForm extends FormWriter
{

    public $travel;

    /**
     * Create a new writer instance.
     *
     * @return void
     */

    public function __construct(TravelOrder $travel)
    {
        $this->travel = $travel;
    }

    /**
     * Write data to Form.
     *
     * @return void
     */
    public function handle()
    {
        $travel = $this->travel;

        $path = $this->travel->file_path;

        if (!$path) {
            $path = storage_path('app/templates/TravelOrderForm.xlsx');
        }

        $file = Excel::load($path, function ($excel) use ($travel) {
            $sheet = $excel->sheet('Sheet1');
            if (!$travel->file_path) {
                $excel->file = $travel->fileName() . '.xlsx';
                $travel->file = $excel->file;
                $travel->save();

                $sheet->setCellValue('I10', date('M d, Y', strtotime($travel->created_at)));
                $sheet->setCellValue('B14', $travel->recipient);
                $sheet->setCellValue('A18', $travel->destination);
                $sheet->setCellValue('A22', $travel->purpose);
                $sheet->setCellValue('C26', $travel->date_from);
                $sheet->setCellValue('F26', $travel->date_to);
                $sheet->setCellValue('D28', $travel->expenses);
                $sheet->setCellValue('B34', $travel->finance_director ? strtoupper($travel->finance_director->full_name) : null);
                $sheet->setCellValue('H34', $travel->recommending_approval ? strtoupper($travel->recommending_approval->full_name) : null);
                $sheet->setCellValue('A41', strtoupper($travel->approved_by->full_name));
            }

            if ($travel->isStatus('certified')) {
                $sheet->setCellValue('F8', $travel->travel_order_number);
                $this->attachSignature($excel);
            }

        });
        $file->store('xlsx', 'files/TravelOrders', true);
    }

    protected function attachSignature($reader)
    {
        if ($this->travel->recommending_approval && $this->travel->recommending_approval->user->signature_path) {
            excel_attach_image([
                'name' => $this->travel->recommending_approval->full_name,
                'path' => $this->travel->recommending_approval->user->signature_path,
                'coordinates' => 'H32',
                'worksheet' => $reader->sheet('Sheet1'),
            ]);
        }
        if ($this->travel->approved_by && $this->travel->approved_by->user->signature_path) {
            excel_attach_image([
                'name' => $this->travel->approved_by->full_name,
                'path' => $this->travel->approved_by->user->signature_path,
                'coordinates' => 'D39',
                'worksheet' => $reader->sheet('Sheet1'),
            ]);
        }
        if ($this->travel->finance_director && $this->travel->finance_director->user->signature_path) {
            excel_attach_image([
                'name' => $this->travel->finance_director->full_name,
                'path' => $this->travel->finance_director->user->signature_path,
                'coordinates' => 'B32',
                'worksheet' => $reader->sheet('Sheet1'),
            ]);
        }
        return true;
    }

}

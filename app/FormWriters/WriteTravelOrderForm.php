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
     * Execute the job.
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
                $excel->file  = $travel->fileName() . '.xlsx';
                $travel->file = $excel->file;
                $travel->save();

                $sheet->setCellValue('I10', date('M d, Y', strtotime($travel->created_at)));
                $sheet->setCellValue('B14', $travel->recipient);
                $sheet->setCellValue('A18', $travel->destination);
                $sheet->setCellValue('A22', $travel->purpose);
                $sheet->setCellValue('C26', $travel->date_from);
                $sheet->setCellValue('F26', $travel->date_to);
                $sheet->setCellValue('D28', to_currency($travel->expenses));
                $sheet->setCellValue('B34', $travel->certified_by ? strtoupper($travel->certified_by->full_name) : null);
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
        if ($this->travel->recommending_approval && $this->travel->recommending_approval->user->signature) {
            excel_attach_image([
                'name'        => $this->travel->recommending_approval->full_name,
                'path'        => $this->travel->recommending_approval->user->signature,
                'coordinates' => 'H32',
                'worksheet'   => $reader->sheet('Sheet1'),
            ]);
        }
        if ($this->travel->approved_by && $this->travel->approved_by->user->signature) {
            excel_attach_image([
                'name'        => $this->travel->approved_by->full_name,
                'path'        => $this->travel->approved_by->user->signature,
                'coordinates' => 'D39',
                'worksheet'   => $reader->sheet('Sheet1'),
            ]);
        }
        if ($this->travel->certified_by && $this->travel->certified_by->user->signature) {
            excel_attach_image([
                'name'        => $this->travel->certified_by->full_name,
                'path'        => $this->travel->certified_by->user->signature,
                'coordinates' => 'B32',
                'worksheet'   => $reader->sheet('Sheet1'),
            ]);
        }
        return true;
    }

}

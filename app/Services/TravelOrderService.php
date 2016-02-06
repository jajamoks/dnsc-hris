<?php namespace DNSCHumanResource\Services;

class TravelOrderService
{

    public function approve($travel)
    {
        switch ($travel->status) {
            case 'filed':
                $travel->status = 'recommended';
                break;
            case 'recommended':
                $travel->status = 'approved';
                break;
            case 'approved':
                $travel->status = 'certified';
                $travel->travel_order_number = $travel->getTravelOrderNumber();
                break;
        }
        $travel->save();

        return $travel;
    }

    public function disapprove()
    {

    }

}

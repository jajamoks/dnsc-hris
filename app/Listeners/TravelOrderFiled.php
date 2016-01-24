<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\TravelOrderFiled as Event;
use DNSCHumanResource\FormWriters\FormWriter;
use DNSCHumanResource\FormWriters\WriteTravelOrderForm;

class TravelOrderFiled extends FormWriter
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  TravelOrderLeaveFiled  $event
     * @return void
     */
    public function handle(Event $event)
    {
        write_form(new WriteTravelOrderForm($event->travel));

        $event->travel->notifications()->create([
            'sent_to' => $this->checkApprovals($event->travel)->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Travel order',
            'message' => auth()->user()->employee->full_name . ' filed a travel order and waiting for your approval.',
            'icon'    => 'plane',
            'color'   => 'success',
        ]);
    }

    protected function checkApprovals($travel)
    {
        if ($travel->recommending_approval) {
            return $travel->recommending_approval;
        } elseif ($travel->finance_director) {
            return $travel->finance_director;
        }
        return $travel->approved_by;
    }
}

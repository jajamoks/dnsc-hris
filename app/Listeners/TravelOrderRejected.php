<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\TravelOrderRejected as Event;

class TravelOrderRejected
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
     * @param  TravelOrderRejected  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $travel = $event->travel;

        $travel->notifications()->create([
            'sent_to' => $travel->employee->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Travel order',
            'message' => 'Your travel order has been ' . $travel->status . ' by ' . auth()->user()->employee->full_name,
            'icon'    => 'plane',
            'color'   => 'danger',
        ]);
    }
}

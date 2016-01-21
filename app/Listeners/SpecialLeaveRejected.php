<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\SpecialLeaveRejected as Event;

class SpecialLeaveRejected
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
     * @param  SpecialLeaveRejected  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $leave = $event->leave;

        $leave->notifications()->create([
            'sent_to' => $leave->employee->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Leave request',
            'message' => 'Your special leave request has been ' . $leave->status . ' by ' . auth()->user()->employee->full_name,
            'icon'    => 'star',
            'color'   => 'danger',
        ]);
    }
}

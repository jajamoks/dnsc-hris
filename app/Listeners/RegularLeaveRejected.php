<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\RegularLeaveRejected as Event;
use DNSCHumanResource\FormWriters\WriteRegularLeaveForm;
use Illuminate\Foundation\Bus\DispatchesJobs;

class RegularLeaveRejected
{

    use DispatchesJobs;
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
     * @param  RegularLeaveRejected  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $leave = $event->leave;

        write_form(new WriteRegularLeaveForm($leave));

        $leave->notifications()->create([
            'sent_to' => $leave->employee->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Leave request',
            'message' => 'Your leave request has been ' . $leave->status . ' by ' . auth()->user()->employee->full_name,
            'icon'    => 'thumbs-up',
            'color'   => 'danger',
        ]);
    }
}

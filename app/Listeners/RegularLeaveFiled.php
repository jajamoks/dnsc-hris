<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\RegularLeaveFiled as Event;
use DNSCHumanResource\FormWriters\WriteRegularLeaveForm;

class RegularLeaveFiled
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
     * @param  RegularLeaveFiled  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $leave = $event->leave;

        write_form(new WriteRegularLeaveForm($leave));

        $leave->notifications()->create([
            'sent_to' => $this->checkApprovals($leave)->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Regular Leave Request',
            'message' => auth()->user()->employee->full_name . ' filed a leave request and waiting for your approval.',
            'icon'    => 'thumbs-up',
            'color'   => 'danger',
        ]);
    }

    protected function checkApprovals($leave)
    {
        if ($leave->recommending_approval) {
            return $leave->recommending_approval;
        }
        return $leave->approved_by;
    }
}

<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\SpecialLeaveFiled as Event;

class SpecialLeaveFiled
{

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Handle the event.
     *
     * @param  SpecialLeaveFiled  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $leave = $event->leave;
        $leave->notifications()->create([
            'sent_to' => $this->checkApprovals($leave)->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Leave Request',
            'message' => auth()->user()->employee->full_name . ' filed a special leave request and waiting for your approval.',
            'icon'    => 'star',
            'color'   => 'warning',
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

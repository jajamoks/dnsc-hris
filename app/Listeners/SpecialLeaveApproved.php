<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\SpecialLeaveApproved as Event;

class SpecialLeaveApproved
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
     * @param  SpecialLeaveApproved  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $leave = $event->leave;

        $leave->notifications()->create([
            'sent_to' => $leave->employee->user->id,
            'sent_by' => auth()->user()->id,
            'subject' => 'Special Leave request',
            'message' => 'Your special leave request has been ' . $leave->status . ' by ' . auth()->user()->employee->full_name,
            'icon'    => 'star',
            'color'   => 'warning',
        ]);

        $recipient = $this->checkStatus($leave);

        if ($recipient) {
            $leave->notifications()->create([
                'sent_to' => $recipient->user->id,
                'sent_by' => $leave->employee->user->id,
                'subject' => 'Special leave request',
                'message' => 'Special leave request of ' . $leave->employee->full_name . ' is awaiting for your approval.',
                'icon'    => 'star',
                'color'   => 'warning',
            ]);
        }
    }

    protected function checkStatus($leave)
    {
        if ($leave->isStatus('recommended')) {
            return $leave->approved_by;
        } elseif ($leave->isStatus('approved')) {
            return $leave->certified_by;
        }
        return null;
    }
}

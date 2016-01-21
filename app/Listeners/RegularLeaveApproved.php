<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\RegularLeaveApproved as Event;
use DNSCHumanResource\FormWriters\WriteRegularLeaveForm;

class RegularLeaveApproved
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
     * @param  RegularLeaveApproved  $event
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

        $recipient = $this->checkStatus($leave);

        if ($recipient) {
            $leave->notifications()->create([
                'sent_to' => $recipient->user->id,
                'sent_by' => $leave->employee->user->id,
                'subject' => 'Leave request',
                'message' => 'Leave request of ' . $leave->employee->full_name . ' is awaiting for your approval.',
                'icon'    => 'thumbs-up',
                'color'   => 'danger',
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

<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\TravelOrderApproved as Event;
use DNSCHumanResource\FormWriters\WriteTravelOrderForm;

class TravelOrderApproved
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
     * @param  TravelOrderApproved  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $travel = $event->travel;

        if ($travel->isStatus('recommended')) {
            $this->notify($travel, $travel->employee->user, $travel->finance_director->user);
        } elseif ($travel->isStatus('approved')) {
            $this->notify($travel, $travel->employee->user, $travel->approved_by->user);
        } elseif ($travel->isStatus('certified')) {
            write_form(new WriteTravelOrderForm($travel));
            $travel->notifications()->create([
                'sent_to' => $travel->employee->user->id,
                'sent_by' => auth()->user()->id,
                'subject' => 'Travel order',
                'message' => 'Your leave request has been ' . $travel->status . ' by ' . auth()->user()->employee->full_name,
                'icon'    => 'plane',
                'color'   => 'success',
            ]);
        }

        // if ($travel->isStatus('certified')) {
        //     write_form(new WriteTravelOrderForm($travel));
        //     $travel->notifications()->create([
        //         'sent_to' => $travel->employee->user->id,
        //         'sent_by' => auth()->user()->id,
        //         'subject' => 'Travel order',
        //         'message' => 'Your leave request has been ' . $travel->status . ' by ' . auth()->user()->employee->full_name,
        //         'icon'    => 'plane',
        //         'color'   => 'success',
        //     ]);
        // } elseif ($travel->isStatus('recommended')) {
        //     $travel->notifications()->create([
        //         'sent_to' => $travel->approved_by->user->id,
        //         'sent_by' => $travel->employee->user->id,
        //         'subject' => 'Travel order',
        //         'message' => 'Travel order filed by ' . $travel->employee->full_name . ' is waiting for your approval.',
        //         'icon'    => 'plane',
        //         'color'   => 'success',
        //     ]);
        // } elseif ($travel->isStatus('approved')) {
        //     $travel->notifications()->create([
        //         'sent_to' => $travel->certified_by->user->id,
        //         'sent_by' => $travel->employee->user->id,
        //         'subject' => 'Travel Order',
        //         'message' => 'Travel order filed by ' . $travel->employee->full_name . ' is waiting for your approval.',
        //         'icon'    => 'plane',
        //         'color'   => 'success',
        //     ]);
        // }
    }

    protected function notify($travel, $sender, $recipient)
    {
        $travel->notifications()->create([
            'sent_to' => $recipient->id,
            'sent_by' => $sender->id,
            'subject' => 'Travel Order',
            'message' => 'Travel order filed by ' . $travel->employee->full_name . ' is waiting for your approval.',
            'icon'    => 'plane',
            'color'   => 'success',
        ]);
    }
}

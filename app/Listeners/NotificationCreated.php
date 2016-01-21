<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\NotificationCreated as Event;
use DNSCHumanResource\Models\Notification;

class NotificationCreated
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
     * @param  NotificationCreated  $event
     * @return void
     */
    public function handle(Event $event)
    {
        try {
            $notification     = Notification::find($event->notification->id);
            $cellphone_number = $notification->sent_to_user->employee->cellphone_number;

            if (!empty($cellphone_number)) {
                itexmo($cellphone_number, $notification->subject . ': ' . $notification->message);
            }
            // Mail::raw($notification->message, function ($message) use ($notification) {
            //     $message->from(env('MAIL_USERNAME'), 'Davao del Norte State College Human Resource');
            //     $message->to($notification->sent_to_user->email);
            //     $message->subject($notification->subject);
            // });
        } catch (\ErrorException $ex) {

        }
    }
}

<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\NotificationCreated as Event;
use DNSCHumanResource\Models\Notification;
use LRedis;

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
            $notification     = Notification::with('sent_to_user', 'sent_by_user')->findOrFail($event->notification->id);
            $cellphone_number = $notification->sent_to_user->employee->cellphone_number;

            LRedis::publish('notification', json_encode($notification)); // send to socket, real time noty

            if (!empty($cellphone_number)) {
                itexmo($cellphone_number, $notification->subject . ': ' . $notification->message);
            }
        } catch (\ErrorException $ex) {

        }
    }
}

<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Notification;

class NotificationController extends Controller
{

    public function getAllUnreadNotifications()
    {
        $notifications = Notification::where('sent_to', auth()->user()->id)->orderBy('created_at', 'desc')->unread()->paginate(15)->jsonSerialize();
        return response()->json($notifications, 200);
    }

    public function markRead(Notification $notification)
    {
        if (!$notification->is_read) {
            $notification->is_read = 1;
            $notification->save();
        }
        return response()->json('Notification marked read', 200);
    }

}

<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Employee;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        return view('notifications.all');
    }

    public function markAllRead(Request $request)
    {
        $notifications = auth()->user()->notifications_sent_to_me()->unread()->get();
        foreach ($notifications as $notification) {
            $notification->is_read = 1;
            $notification->update();
        }
        if ($request->wantsJson()) {
            return $notifications;
        }
        flash()->success('All notifications are marked read.');
        return redirect()->back();
    }

    public function markNotificationRead(Notification $notification)
    {
        $notification->isRead(1);
        $notification->update();
    }

    public function notifications()
    {
        $notifications = auth()->user()->notifications()->unread()->get();

        $user_notifications = collect();
        foreach ($notifications as $notification) {
            $user_notifications->push([
                'subject'     => $notification->subject,
                'message'     => $notification->message,
                'object_type' => $notification->object_type,
                'object_id'   => value(function () use ($notification) {
                    if ($notification->object_type == 'employee') {
                        return Employee::find($notification->object_id)->user->username;
                    } else {
                        return $notification->object_id;
                    }
                }),
                'created_at'  => $notification->created_at,
            ]);
        }
        return $user_notifications;
    }
}

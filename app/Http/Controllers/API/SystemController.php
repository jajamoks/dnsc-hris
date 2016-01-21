<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Notification;

class SystemController extends Controller
{

    public function getActivityLogs()
    {
        $logs = Notification::with('sent_to_user', 'sent_by_user')->orderBy('created_at', 'desc')->paginate(15);

        return response()->json($logs, 200);
    }

}

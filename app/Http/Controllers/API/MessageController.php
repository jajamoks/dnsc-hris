<?php

namespace DNSCHumanResource\Http\Controllers\API;

use Auth;
use Carbon\Carbon;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Message;
use DNSCHumanResource\Models\MessageGroup;
use Illuminate\Http\Request;

class MessageController extends Controller
{

    public $user;

    public function __construct()
    {
        $this->user = Auth::user();
    }

    public function index()
    {
        $threads = $this->user->message_groups()->with(['messages' => function ($query) {
            $query->orderBy('created_at', 'desc');
        }, 'owner.employee'])->get();
        return $threads;
    }

    public function store(Request $request)
    {
        $message = auth()->user()->messages()->create($request->all());
        $message->recipients()->sync($message->message_group->users->keyBy('id')->keys()->all());

        $message = Message::with('sender.employee')->where('id', $message->id)->first();

        redis_publish('message', $message);
        return $message;
    }

    public function unread(Request $request)
    {
        return auth()->user()->received_messages()->with('sender.employee')->unread()->get()->keyBy('sender_id')->values();
    }

    public function show(Request $request, $messageGroupID)
    {
        if ($request->wantsJson()) {
            $messageGroup = MessageGroup::findOrFail($messageGroupID);

            $messages = $messageGroup->messages()->with('sender.employee')->get();
            return $messages;
        }
    }

    public function markAllRead()
    {
        $messages = auth()->user()->received_messages()->where('is_read', 0)->get();
        foreach ($messages as $message) {
            $message->pivot->is_read   = 1;
            $message->pivot->time_seen = Carbon::now();
            $message->pivot->save();
        }
    }

    public function destroy(Request $request, $id)
    {
        $message = Message::findOrFail($id);
        $message->delete();
        return response('Message deleted!', 200);
    }

}

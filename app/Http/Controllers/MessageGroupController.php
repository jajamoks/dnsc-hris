<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\MessageGroup;
use Illuminate\Http\Request;

class MessageGroupController extends Controller
{

    public function rename(Request $request, $id)
    {
        $group = MessageGroup::findOrFail($id);
        if ($group->owner_id === auth()->user()->id) {
            $group->name = $request->group_name;
            $group->save();
            return $group;
        }
        return response('Unauthorized!', 401);
    }

    public function clear()
    {
        $groups = auth()->user()->message_groups()->delete();
        return response('Messages cleared!', 200);
    }

    public function updateParticipants(Request $request, $id)
    {
        $messageGroup = MessageGroup::findOrFail($id);
        if ($request->isMethod('GET')) {
            return response()->view('messages.partials.update-participants', compact('messageGroup'));
        }
        $messageGroup->users()->sync($request->recipients);
        if ($messageGroup) {
            flash()->success('Participants added!');
            return redirect()->back();
        }
    }

    public function destroy(Request $request, $id)
    {
        $messageGroup = MessageGroup::findOrFail($id);
        if ($messageGroup->isGroupOwner()) {
            $messageGroup->delete();
            return response('Message group deleted!', 200);
        }
        return response('Cannot delete message!', 200);
    }

}

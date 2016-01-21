<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Message;
use DNSCHumanResource\Models\MessageGroup;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;
use Validator;

class MessageController extends Controller
{
    /**
     * @var mixed
     */
    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('employee')->get();
        return view('messages.index')->with(compact('users'));
    }

    /**
     * @return mixed
     */
    public function create()
    {
        $users = User::with('employee')->get()->reject(function ($user) {
            return $user->id === auth()->user()->id;
        });
        return response()->view('messages.create', with(compact('users')));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validator($request->all())->fails()) {
            return redirect()->back();
        }
        $recipients = $request->recipient;
        // push owner to recipients array
        array_push($recipients, (String) auth()->user()->id);
        // search for messageGroup with same recipients
        $messageGroup = $this->searchMembersInMessageGroups($recipients);
        // create messageGroup if not found in searching members
        if (!$messageGroup) {
            $messageGroup = MessageGroup::create(['owner_id' => auth()->user()->id]);
        }
        // sync message group members
        $messageGroup->users()->sync($recipients);
        // store the new message
        $message = $messageGroup->messages()->create(['sender_id' => auth()->user()->id, 'message' => $request->message]);
        // sync message recipients
        $message->recipients()->sync($recipients);
        flash()->success('Message sent to recipient!');
        return redirect()->back();
    }

    /**
     * Search for equal members in newly created message
     *
     * @param $data
     * @return mixed
     */
    protected function searchMembersInMessageGroups($data)
    {
        $groups = auth()->user()->message_groups()->with('users')->get();
        foreach ($groups as $group) {
            $members = $group->users->keyBy('id')->keys()->all();
            if (empty(array_diff($members, $data)) && empty(array_diff($data, $members))) {
                return $group;
            }
        }
        return null;
    }

    /**
     * @param $data
     */
    protected function validator($data)
    {
        return Validator::make($data, [
            'message' => 'required',
        ]);
    }
}

<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Mail;
use Validator;

class MailController extends Controller
{

    protected $user;

    public function __construct()
    {
        $this->user = auth()->user();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $message = null;
        if ($this->validator($request->all())->fails()) {
            flash()->error('Please fill all the required field!');
            return redirect()->back()->withInput();
        }
        if ($this->user->email) {
            $employee = $this->user->employee;
            $sender = [
                'email' => $this->user->email,
                'name' => $employee ? $employee->fullName() : $this->user->username,
            ];
            $recipient = $request->recipient;

            $message = Mail::raw($request->content, function ($msg) use ($request, $sender) {
                $msg->from($sender['email'], $sender['name']);
                $msg->to($request->recipient);
                $msg->subject($request->subject);
                $request->cc ? $message->cc($request->cc) : null;
                $request->bcc ? $message->cc($request->bcc) : null;
            });
        }

        if ($message) {
            flash()->success('Message successfully sent!');
        } else {
            flash()->error('Message not sent!');
        }
        return redirect()->back();
    }

    public function validator($data)
    {
        return Validator::make($data, [
            'recipient' => 'required',
            'content' => 'required',
        ]);
    }
}

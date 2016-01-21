<?php

namespace DNSCHumanResource\Policies;

use DNSCHumanResource\Models\Message;
use DNSCHumanResource\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class MessagePolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function store(User $user, Message $message)
    {
        if ($user->id == $message->recipient_id) {
            return false;
        }
        return true;
    }
}

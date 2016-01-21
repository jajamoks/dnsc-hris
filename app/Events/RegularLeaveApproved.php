<?php

namespace DNSCHumanResource\Events;

use DNSCHumanResource\Events\Event;
use DNSCHumanResource\Models\EmployeeLeave;
use Illuminate\Queue\SerializesModels;

class RegularLeaveApproved extends Event
{
    use SerializesModels;

    public $leave;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(EmployeeLeave $leave)
    {
        $this->leave = $leave;
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return [];
    }
}

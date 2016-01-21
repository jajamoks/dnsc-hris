<?php

namespace DNSCHumanResource\Events;

use DNSCHumanResource\Events\Event;
use DNSCHumanResource\Models\EmployeeUtility;
use Illuminate\Queue\SerializesModels;

class EmployeeUtilityUpdated extends Event
{
    use SerializesModels;

    public $utility;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(EmployeeUtility $utility)
    {
        $this->utility = $utility;
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

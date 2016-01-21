<?php

namespace DNSCHumanResource\Events;

use DNSCHumanResource\Events\Event;
use DNSCHumanResource\Models\TravelOrder;
use Illuminate\Queue\SerializesModels;

class TravelOrderRejected extends Event
{
    use SerializesModels;

    public $travel;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(TravelOrder $travel)
    {
        $this->Travel = $travel;
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

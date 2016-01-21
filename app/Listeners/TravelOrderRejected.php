<?php

namespace DNSCHumanResource\Listeners;

use DNSCHumanResource\Events\TravelOrderRejected;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class TravelOrderRejected
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  TravelOrderRejected  $event
     * @return void
     */
    public function handle(TravelOrderRejected $event)
    {
        //
    }
}

<?php

namespace DNSCHumanResource\Models\Pivots;

use Illuminate\Database\Eloquent\Relations\Pivot;

class TrainingParticipant extends Pivot
{

    protected $casts = ['include_in_pds' => 'boolean'];

    protected $appends = ['is_going'];

    public function getIsGoingAttribute()
    {
        return $this->rvsp === 'going';
    }

}

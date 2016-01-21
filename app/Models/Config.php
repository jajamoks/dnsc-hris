<?php

namespace DNSCHumanResource\Models;

use Illuminate\Database\Eloquent\Model;

class Config extends Model
{

    public function scopeOfValue($query, $config)
    {
        $model = $query->where('config', $config)->first();
        return $model ? $model->value : null;
    }

}

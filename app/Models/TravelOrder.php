<?php

namespace DNSCHumanResource\Models;

use Carbon\Carbon;
use DNSCHumanResource\Events\TravelOrderFiled;
use DNSCHumanResource\Traits\Notificationable;
use Illuminate\Database\Eloquent\Model;

class TravelOrder extends Model
{

    use Notificationable;

    protected $fillable = [
        'recipient',
        'destination',
        'purpose',
        'date_from',
        'date_to',
        'expenses',
        'status',
        'certified_by_id',
        'recommending_approval_id',
        'approved_by_id',
        'file',
    ];

    protected $notification = ['url' => '/travel/', 'findBy' => 'id'];

    protected $appends = ['file_path'];

    public static function boot()
    {
        parent::boot();
        static::created(function ($travel) {
            event(new TravelOrderFiled($travel));
        });
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function recommending_approval()
    {
        return $this->belongsTo(Employee::class, 'recommending_approval_id');
    }

    public function approved_by()
    {
        return $this->belongsTo(Employee::class, 'approved_by_id');
    }

    public function certified_by()
    {
        return $this->belongsTo(Employee::class, 'certified_by_id');
    }

    /**
     * Query Scopes
     * Travel Order status
     */

    public function scopeFiled($query)
    {
        return $query->whereStatus('filed');
    }

    public function scopeRecommended($query)
    {
        return $query->whereStatus('recommended');
    }

    public function scopeApproved($query)
    {
        return $query->whereStatus('approved');
    }

    public function scopeCertified($query)
    {
        return $query->whereStatus('certified');
    }

    public function getTravelOrderNumber()
    {
        $startOfMonth = Carbon::now()->startOfMonth();

        $travelOrderCount = self::certified()->where('created_at', '>=', $startOfMonth)->count();

        return date('Y', strtotime(Carbon::now())) . '-' . date('m', strtotime(Carbon::now())) . '-' . ($travelOrderCount + 1);
    }

    public function fileName()
    {
        return str_slug('travel order ' . $this->employee->user->username . ' ' . date('Y m d', strtotime($this->created_at)), '-');
    }

    public function isStatus($status)
    {
        return $this->status == $status;
    }

    public function getFilePathAttribute()
    {
        $path = public_path('files/TravelOrders/' . $this->file);
        if (file_exists($path) && is_file($path)) {
            return $path;
        }
        return null;
    }

}

<?php

namespace DNSCHumanResource\Http\Controllers\EmployeeLeave;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\EmployeeLeave;
use DNSCHumanResource\Models\EmployeeSpecialLeave;

class LeaveController extends Controller
{

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
        if ($this->user->isAdmin()) {
            $regular_leaves = EmployeeLeave::certified()->orderBy('updated_at', 'desc')->get();
            $special_leaves = EmployeeSpecialLeave::certified()->orderBy('updated_at', 'desc')->get();
            return view('leaves.approved_leaves')->with(compact('regular_leaves', 'special_leaves'));
        }
        flash()->error('You are not allowed to view this.');
        return redirect()->back();
    }

    public function personal()
    {
        $regular_leaves = $this->user->employee->employee_leaves()->orderBy('created_at', 'desc')->get();
        $special_leaves = $this->user->employee->employee_special_leaves()->orderBy('created_at', 'desc')->get();
        return view('leaves.my-filed-leaves')->with(compact('regular_leaves', 'special_leaves'));
    }
}

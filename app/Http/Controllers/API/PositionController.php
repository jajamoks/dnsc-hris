<?php

namespace DNSCHumanResource\Http\Controllers\API;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Position;
use Illuminate\Http\Request;

class PositionController extends Controller
{

    public function index()
    {
        $positions = Position::with('users.employee')->get();
        return response()->json($positions, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $position = Position::create($request->all());
        return response()->json($position, 201);
    }

}

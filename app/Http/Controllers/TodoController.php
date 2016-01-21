<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Todo;
use Illuminate\Http\Request;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $todos = auth()->user()->employee->todos;
        return $todos;
    }

    public function update(Request $request, $id)
    {
        $todo = Todo::findOrFail($id);
        $this->authorize('touch', $todo);
        $todo->todo = $request->todo;
        $todo->save();
        return $todo;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $todo = auth()->user()->employee->todos()->create($request->all());
        if ($todo) {
            return $todo;
        }
    }

    public function toggleDone($id)
    {
        $todo = Todo::findOrFail($id);
        $this->authorize('touch', $todo);
        if ($todo->isDone()) {
            $todo->is_done = 0;
        } else {
            $todo->is_done = 1;
        }
        $todo->save();
        return $todo;
    }

    public function destroy($id)
    {
        $todo = Todo::findOrFail($id);
        $this->authorize('touch', $todo);
        $todo->delete();
        return response($todo, 200);
    }

    public function destroyAll()
    {
        $todos = auth()->user()->employee->todos();
        $todos->delete();
    }
}

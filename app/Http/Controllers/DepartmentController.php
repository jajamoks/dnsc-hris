<?php

namespace DNSCHumanResource\Http\Controllers;

use Carbon\Carbon as Carbon;
use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Department;
use DNSCHumanResource\Models\DepartmentHead;
use DNSCHumanResource\Models\User;
use Illuminate\Http\Request;
use Validator;

class DepartmentController extends Controller
{

    public function __construct()
    {
        $this->middleware('admin', ['only' => 'index']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
            return response()->view('department.create');
        } else {
            return view('department.create');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit(Department $department)
    {
        $users = User::has('employee')->with('employee')->where('department_id', $department->id)->get();
        return view('department.api.edit')->with(compact('department', 'users'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $page        = 'departments';
        $departments = Department::all();
        return view('department.all')->with(compact('page', 'departments'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show(Request $request, Department $department)
    {
        return view('department.view')->with(compact('department'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        if ($this->validator($request->all())->fails()) {
            flash()->error('You have missing fields.');
            return redirect()->back();
        } else {
            $department = Department::create($request->all());
            if ($department) {
                flash()->success('You have successfully added a new ' . $department->type . '.');
            } else {
                flash()->warning('Something went wrong. Not saved!');
            }
        }
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, Department $department)
    {
        if ($this->validator($request->all())->fails()) {
            flash()->error('You have missing fields.');
            return redirect()->back();
        }
        $department->update($request->all());
        if ($request->employee_id != null) {
            $department_head = DepartmentHead::create([
                'department_id' => $department->id,
                'employee_id'   => $request->employee_id,
                'date_from'     => Carbon::today(),
                'date_to'       => null,
            ]);
        }
        flash()->success($department->name . ' successfully updated!');
        return redirect()->to('/departments');
    }

    protected function validator($data)
    {
        return Validator::make($data, [
            'code' => 'required',
            'name' => 'required',
            'type' => 'required',
        ]);
    }
}

<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Department;
use DNSCHumanResource\Models\Position;
use DNSCHumanResource\Models\User;
use HumanResource;
use Illuminate\Http\Request;
use Image;

class UserController extends Controller
{

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
            $positions = Position::all();
            return response()->view('user.partials.create', with(compact('positions')));
        }
        return view('admin.add_user');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit(User $user)
    {
        if ($user) {
            $president   = HumanResource::president();
            $positions   = Position::all();
            $departments = Department::department()->get();
            $institutes  = Department::institute()->get();
            return view('user.api.edit')->with(compact('user', 'president', 'positions', 'departments', 'institutes'));
        } else {
            return false;
        }
    }

    public function update(Request $request, User $user)
    {
        if ($user) {
            $user->update($request->all());
            if ($request->positions) {
                $user->positions()->sync($request->positions);
            } else {
                $user->positions()->sync([]);
            }
            flash()->success($user->username . ' successfully updated.');
        } else {
            flash()->error('An unknown error occured!');
        }
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function updateCredentials(Request $request)
    {

        $user = $request->user();

        if ($request->has('email')) {
            $user->email = $request->email;
        }

        if ($request->has('password')) {
            $this->validate($request, ['password' => 'confirmed', 'old_password' => 'validate_auth_user']);
            $user->password = bcrypt($request->password);
        }

        if ($request->hasFile('signature')) {
            $this->validate($request, ['signature' => 'mimes:png']);
            $user->signature_path = $this->getSignature($request);
        }

        $user->save();
        flash()->success('User updated!');
        return redirect()->back();
    }

    protected function getSignature($request)
    {
        $name = $request->user()->username . '.png';

        $path = public_path('files/signatures/') . $name;

        if (file_exists($path) && is_file($path)) {
            unlink($path);
        }

        $signature = Image::make($request->signature);

        $signature->fit(125, 68);

        $signature->save($path);

        return $name;
    }

}

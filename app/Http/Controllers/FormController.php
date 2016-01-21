<?php

namespace DNSCHumanResource\Http\Controllers;

use DNSCHumanResource\Http\Controllers\Controller;
use DNSCHumanResource\Models\Form;
use Illuminate\Http\Request;
use Validator;

class FormController extends Controller
{
    public function create()
    {
        return view('forms.upload');
    }

    public function index(Request $request)
    {
        return view('forms.index');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'type' => 'required',
            'file' => 'required|mimes:xlsx,xls,doc,docx,pdf',
        ]);
        if ($validator->fails()) {
            flash()->error('File not uploaded!');
            return redirect()->back();
        }
        if ($request->hasFile('file')) {
            $path        = 'app/forms';
            $storagePath = storage_path($path);
            $file        = $request->file;
            $file->move($storagePath, $file->getClientOriginalName());

            Form::create([
                'name'        => $request->name,
                'description' => $request->description,
                'path'        => $path . '/' . $file->getClientOriginalName(),
                'type'        => $request->type,
            ]);
            flash()->success('Form uploaded!');
        }
        return redirect()->back();
    }

    public function download($id)
    {
        $form = Form::findOrFail($id);
        $path = storage_path($form->path);
        return response()->download($path);
    }

    public function preview($id)
    {
        $form = Form::findOrFail($id);
        $path = storage_path($form->path);
        return redirect()->to(viewDocumentOnline($path));
    }

    public function destroy($id)
    {
        $form = Form::findOrFail($id);
        $this->authorize('delete', $form);
        $path = storage_path($form->path);
        $form->delete();
        if (file_exists($path)) {
            unlink($path);
        }
        return response('Form deleted!', 200);
    }

}

<form id="add-user-form" class="form-horizontal" role="form" action="/departments/{{ $department->code }}" method="POST">
    {!! method_field('PUT') !!}
    {!! csrf_field() !!}

    <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Code </label>

                <div class="col-sm-4">
					<input class="form-control" type="text" name="code" placeholder="Code" value="{{ $department->code }}">
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Name </label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" name="name" placeholder="Institute description / name" value="{{ $department->name }}">
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Type </label>

                <div class="col-sm-8">
                    <select class="form-control" name="type">
                        <option value="institute" {{ ($department->type == 'institute') ? 'selected' : '' }}>Institute</option>
                        <option value="department" {{ ($department->type == 'department') ? 'selected' : '' }}>Department</option>
                    </select>
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Assign Department Head </label>

                <div class="col-sm-8">
                    <select id="employees" class="form-control" data-placeholder="Choose new head..." name="employee_id" tabindex="2">
                        @foreach($users as $user)
                        <option value="{{ $user->employee->id }}" selected="{{ $department->department_heads->first()->employee->id === $user->employee->id }}">{{ $user->employee->fullName() }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="text-right">
        <button type="submit" class="btn btn-default btn-labeled fa fa-edit">Update <strong>{{ $department->name }}</strong></button>
    </div>
</form>

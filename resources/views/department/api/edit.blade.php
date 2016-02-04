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
                <label class="col-sm-3 control-label no-padding-right"> Department Head </label>

                <div class="col-sm-8">
                    <select class="form-control chosen" data-placeholder="Choose new head..." name="employee_id" tabindex="2">
                        @foreach($employees as $employee)
                        <option value="{{ $employee->id }}" {{ $department->head() && $department->head()->employee->id == $employee->id ? 'selected' : null }}>{{ $employee->full_name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Chairperson </label>

                <div class="col-sm-8">
                    <select class="form-control chosen" data-placeholder="Choose new head..." name="chairperson_id" tabindex="2">
                        @foreach($employees as $employee)
                        <option value="{{ $employee->id }}" {{ $department->head() && $department->head()->employee->id == $employee->id ? 'selected' : null }}>{{ $employee->full_name }}</option>
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

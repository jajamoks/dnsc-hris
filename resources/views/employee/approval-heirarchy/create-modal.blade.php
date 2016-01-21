<form id="employee-approval-heirarchy" class="form-horizontal" role="form" action="/employee/approval-heirarchy/{{ $employee->id }}" method="POST">
    {!! isset($approvalHeirarchy) ? method_field('PUT') : null !!}
    {!! csrf_field() !!}

    <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Recommending Approval </label>

                <div class="col-sm-8">
                    <select class="form-control employees" data-placeholder="Select employee..." name="recommending_approval_id" tabindex="2">
                        <option>None</option>
                        @foreach($employees as $employee)
                        <option value="{{ $employee->id }}" {{ isset($approvalHeirarchy) && $approvalHeirarchy->recommending_approval_id == $employee->id ? 'selected' : null }}>{{ $employee->fullName() }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> Approved by </label>

                <div class="col-sm-8">
                    <select class="form-control employees" data-placeholder="Select employee..." name="approved_by_id" tabindex="2">
                        @foreach($employees as $employee)
                        <option value="{{ $employee->id }}" {{ isset($approvalHeirarchy) && $approvalHeirarchy->approved_by_id == $employee->id ? 'selected' : null }}>{{ $employee->full_name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="text-right">
        <button type="submit" class="btn btn-default btn-labeled fa fa-edit">Save changes</button>
    </div>
</form>

<div class="modal fade" id="filter-report">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Filter report</h4>
            </div>
            <form class="form-horizontal" role="form" action="/employee/summary/export" method="POST">
                {!! csrf_field() !!}
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Department </label>

                        <div class="col-sm-8">
                            <select class="selectpicker form-control" name="department">
                                <optgroup label="Administration Department">
                                    @foreach($departments as $department)
                                        <option value="{{ $department->code }}">{{ $department->name }}</option>
                                    @endforeach
                                </optgroup>
                                <optgroup label="Institute">
                                    @foreach($institutes as $institute)
                                        <option value="{{ $institute->code }}">{{ $institute->name }}</option>
                                    @endforeach
                                </optgroup>
                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Status </label>

                        <div class="col-sm-8">
                            <select class="selectpicker form-control" name="status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" data-style="expand-right" class="ladda-button btn btn-primary">Download</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="newUser" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add new user</h4>
            </div>
            <form class="form-horizontal" role="form" action="/register" method="POST">
                <div class="modal-body">
                    {!! csrf_field() !!}
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Employee ID</label>

                        <div class="col-sm-8">
                            <input required id="username" class="form-control" type="text" name="username" placeholder="eg. 2012-0000">
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Account type </label>

                        <div class="col-sm-8">
                            <select class="form-control" name="type">
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                                @if(is_null(HumanResource::president()))
                                <option value="president">President</option>
                                @endif
                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Department </label>

                        <div class="col-sm-8">
                            <select class="selectpicker form-control" name="department_id">
                                <optgroup label="Administration Department">
                                    @foreach($departments as $department)
                                        <option value="{{ $department->id }}">{{ $department->name }}</option>
                                    @endforeach
                                </optgroup>
                                <optgroup label="Institute">
                                    @foreach($institutes as $institute)
                                        <option value="{{ $institute->id }}">{{ $institute->name }}</option>
                                    @endforeach
                                </optgroup>
                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> Position </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="modalPositions" data-chosen="chosen" data-placeholder="Add position..." name="positions[]" multiple tabindex="4" required>
                                @foreach ($positions as $position)
                                <option value="{{ $position->id }}">{{ $position->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button data-style="expand-right" type="submit" class="ladda-button btn btn-primary"><i class="fa fa-save"></i>&nbsp;Save user</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

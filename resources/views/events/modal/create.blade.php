<div id="newEvent" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add new training and seminar</h4>
            </div>
            <form class="form-horizontal" action="/calendar" method="POST">
                <input type="hidden" name="_token" value="{{ csrf_token() }}"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Participants</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="participants" data-chosen="chosen" data-placeholder="Add participants..." name="participants[]" multiple tabindex="4" required>
                                <option value="all">All employees</option>
                                <optgroup label="Department / Institute">
                                    @foreach($departments as $department)
                                    <option value="{{ $department }}">{{ $department->name }}</option>
                                    @endforeach
                                </optgroup>
                                <optgroup label="Employees">
                                    @foreach($employees as $employee)
                                    <option value="{{ $employee->id }}">{{ $employee->full_name }}</option>
                                    @endforeach
                                </optgroup>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Inclusive Dates</label>
                        <div class='col-sm-8'>
                            <div class="input-daterange input-group">
                                <input type="text" class="form-control" name="start" placeholder="Date started" required />
                                <span class="input-group-addon"><i class="ace-icon fa fa-arrow-right"></i></span>
                                <input type="text" class="form-control" name="end" placeholder="Date ended" required />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Event title</label>
                        <div class="col-sm-8">
                            <input type="text" name="title" placeholder="ex: Team Building" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Description</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name="description" placeholder="Add more info..." required></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Place / Venue</label>
                        <div class="col-sm-8">
                            <textarea class="col-xs-12 form-control" name="venue" placeholder="Add a place?" required></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Sponsored by</label>
                        <div class='col-sm-8'>
                            <input type="text" class="form-control" name="sponsored_by" placeholder="Who sponsored this training?" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 no-padding-right control-label">Number of Hours</label>
                        <div class='col-sm-4'>
                            <input type="text" class="form-control" name="number_of_hours" placeholder="Number of hours" required />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button data-style="expand-right" type="submit" class="ladda-button btn btn-primary">Add event</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

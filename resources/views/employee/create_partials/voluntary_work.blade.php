@section('voluntary_work_panel_content')
    @if (!isset($employee) or $employee->employee_voluntary_works->isEmpty())
        <div id="voluntaryWork" class="form-horizontal parent">
            <div class="form-group">
                <label class="col-sm-3 control-label">Name of organization <small>(Write in full)</small></label>
                <div class="form-group col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                        <input type="text" class="form-control" name="voluntary_work_organization_name[]"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Address of organization <small>(Write in full)</small></label>
                <div class="form-group col-sm-8">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                        <input type="text" class="form-control" name="voluntary_work_address[]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Inclusive Dates</label>
                <div class="form-group col-sm-4">
                    <div class="input-group input-daterange">
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="voluntary_work_start_date[]" placeholder="Date started" value="{{ NULL }}"/>
                        <span class="input-group-addon">to</span>
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="voluntary_work_end_date[]" placeholder="Date ended" value="{{ NULL }}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Number of hours</label>
                <div class="form-group col-sm-3">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                        <input type="number" class="form-control" name="voluntary_work_hours[]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Position / Nature of work</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                        <input type="text" class="form-control" name="voluntary_work_position[]" />
                    </div>
                </div>
            </div>

            <hr>
        </div>
    @else
        @foreach ($employee->employee_voluntary_works as $voluntary_work)
            <div id="voluntaryWork" class="form-horizontal parent">
                <input type="hidden" name="employee_voluntary_work_id[]" value="{{ $voluntary_work->id }}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Name of organization <small>(Write in full)</small></label>
                    <div class="form-group col-sm-6">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                            <input type="text" class="form-control" name="voluntary_work_organization_name[]" value="{{ $voluntary_work->organization_name }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Address of organization <small>(Write in full)</small></label>
                    <div class="form-group col-sm-8">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                            <input type="text" class="form-control" name="voluntary_work_address[]" value="{{ $voluntary_work->organization_address }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Inclusive Dates</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group input-daterange">
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="voluntary_work_start_date[]" placeholder="Date started" value="{{ $voluntary_work->date_from or NULL }}"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="voluntary_work_end_date[]" placeholder="Date ended" value="{{ $voluntary_work->date_to or NULL }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Number of hours</label>
                    <div class="form-group col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                            <input type="number" class="form-control" name="voluntary_work_hours[]" value="{{ $voluntary_work->number_of_hours }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Position / Nature of work</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                            <input type="text" class="form-control" name="voluntary_work_position[]" value="{{ $voluntary_work->position }}"/>
                        </div>
                    </div>
                </div>

                <hr>
            </div>
        @endforeach
    @endif
@endsection

@include('employee.create_partials.pds-panel', [
    'panel_body_id' => 'voluntary-work-panel',
    'clone_element' => 'voluntaryWork',
    'title' => 'Voluntary Work',
    'as' => 'voluntary_work'
])

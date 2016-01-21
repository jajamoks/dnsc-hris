@section('training_programs_panel_content')
    @if ( !isset($employee) or $employee->employee_training_programs->isEmpty())
        <div id="trainingPrograms" class="form-horizontal parent">
            <input type="hidden" name="training_id[]"/>
            <div class="form-group">
                <label class="col-sm-3 control-label">Title of seminar / conference / workshop / short courses <small>(Write in full)</small></label>
                <div class="form-group col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input spellcheck="true" type="text" class="form-control" name="training_title[]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Inclusive Dates</label>
                <div class="form-group col-sm-4">
                    <div class="input-group input-daterange">
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="training_start_date[]" placeholder="Date started" value="{{ NULL }}"/>
                        <span class="input-group-addon">to</span>
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="training_end_date[]" placeholder="Date ended" value="{{ NULL }}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Number of hours</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                        <input type="text" class="form-control" name="training_hours[]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Conducted / Sponsored by <small>(Write in full)</small></label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="training_sponsor[]" />
                    </div>
                </div>
            </div>
            <hr>
        </div>
    @else
        @foreach ($employee->employee_training_programs as $training_program)
            <div id="trainingPrograms" class="form-horizontal parent">
                <input type="hidden" name="training_id[]" value="{{ $training_program->id }}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Title of seminar / conference / workshop / short courses <small>(Write in full)</small></label>
                    <div class="form-group col-sm-6">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input spellcheck="true" type="text" class="form-control" name="training_title[]" value="{{ $training_program->title }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Inclusive Dates</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group input-daterange">
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="training_start_date[]" placeholder="Date started" value="{{ $training_program->date_from or NULL }}"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="training_end_date[]" placeholder="Date ended" value="{{ $training_program->date_to or NULL }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Number of hours</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                            <input type="text" class="form-control" name="training_hours[]" value="{{ $training_program->number_of_hours }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Conducted / Sponsored by <small>(Write in full)</small></label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="training_sponsor[]" value="{{ $training_program->sponsored_by }}"/>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
        @endforeach
    @endif
@endsection

@include('employee.create_partials.pds-panel', [
    'panel_body_id' => 'training-programs-panel',
    'clone_element' => 'trainingPrograms',
    'title' => 'Traning Programs',
    'as' => 'training_programs'
])

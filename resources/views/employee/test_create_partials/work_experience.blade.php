@section('work_panel_content')
    @if (!isset($employee) or $employee->employee_work_experiences->isEmpty())
        <div id="workExperience" class="form-horizontal parent">
            <div class="form-group">
                <label class="col-sm-3 control-label">Inclusive Dates</label>
                <div class="form-group col-sm-4">
                    <div class="input-group input-daterange">
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_work_experiences[date_from][]" placeholder="Date started"/>
                        <span class="input-group-addon">to</span>
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_work_experiences[date_to][]" placeholder="Date ended"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Position Title</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_work_experiences[position_title][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Department / Agency / Office / Company <small>(Write in full)</small></label>
                <div class="form-group col-sm-8">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                        <input type="text" class="form-control" name="employee_work_experiences[company][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Monthly Salary</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                        <input type="text" class="form-control" name="employee_work_experiences[monthly_salary][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Salary grade & Step Increment <small>(format '00-0')</small></label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>
                        <input type="text" class="form-control" name="employee_work_experiences[salary_grade][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Status of appointment</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                        <input type="text" class="form-control" name="employee_work_experiences[status_of_appointment][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Government service</label>
                <div class="form-group col-sm-2">
                    <select name="employee_work_experiences[government_service][]" class="form-control">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                    </select>
                </div>
            </div>
            <hr>
        </div>
    @else
        @foreach ($employee->employee_work_experiences as $work_experience)
            <div id="workExperience" class="form-horizontal parent">
                <input type="hidden" name="work_experience_id[]" value="{{ $work_experience->id }}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Inclusive Dates</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group input-daterange">
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="work_start_date[]" placeholder="Date started" value="{{ $work_experience->date_from }}"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="work_end_date[]" placeholder="Date ended" value="{{ $work_experience->date_to }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Position Title</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="work_position_title[]" value="{{ $work_experience->position_title }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Department / Agency / Office / Company <small>(Write in full)</small></label>
                    <div class="form-group col-sm-8">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                            <input type="text" class="form-control" name="work_company[]" value="{{ $work_experience->company }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Monthly Salary</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-money"></i></span>
                            <input type="number" class="form-control" name="work_monthly_salary[]" value="{{ $work_experience->monthly_salary }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Salary grade & Step Increment <small>(format '00-0')</small></label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>
                            <input type="text" class="form-control" name="work_salary_grade[]" value="{{ $work_experience->salary_grade }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Status of appointment</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-money"></i></span>
                            <input type="text" class="form-control" name="work_status_of_appointment[]" value="{{ $work_experience->status_of_appointment }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Government service</label>
                    <div class="form-group col-sm-2">
                        <select name="work_government_service[]" class="form-control">
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                </div>
                <hr>
            </div>
        @endforeach
    @endif
@endsection

@include('employee.create_partials.pds-panel', [
    'panel_body_id' => 'work-experience-panel',
    'clone_element' => 'workExperience',
    'title' => 'Work Experience',
    'as' => 'work'
])

@section('educational_background_panel_content')
    @if (!isset($employee) or $employee->employee_educations->isEmpty())
        <div id="educationalBackground" class="form-horizontal parent">
            <input type="hidden" name="employee_educations[id][]"/>
            <div class="form-group">
                <label class="col-sm-3 control-label">Level</label>
                <div class="form-group col-sm-6">
                    <select class="form-control" name="employee_educations[level][]">
                        <option value="elementary">Elementary</option>
                        <option value="secondary">Secondary</option>
                        <option value="vocational">Vocational / Trade Course</option>
                        <option value="college">College</option>
                        <option value="graduate studies">Graduate Studies</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Name of School&nbsp;<small>Write in full</small></label>
                <div class="form-group col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_educations[school][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Degree / Course&nbsp;<small>Write in full</small></label>
                <div class="form-group col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_educations[degree_course][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Year Graduated</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_educations[year_graduated][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Inclusive Dates</label>
                <div class="form-group col-sm-4">
                    <div class="input-group input-daterange">
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_educations[start][]" placeholder="Date started"/>
                        <span class="input-group-addon">to</span>
                        <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_educations[end][]" placeholder="Date ended"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Highest Grade / Level / Units Earned <small>if not graduated</small></label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                        <input type="text" class="form-control" name="employee_educations[highest_level][]" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Scholarship / Academic Honors Received</label>
                <div class="form-group col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_educations[academic_honors][]" />
                    </div>
                </div>
            </div>
            <hr class="alt">
        </div>
    @else
        @foreach($employee->employee_educations as $education)
            <div id="educationalBackground" class="form-horizontal parent">
                <input type="hidden" name="education_id[]"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Level</label>
                    <div class="form-group col-sm-6">
                        <select class="form-control" name="employee_educations[level][]">
                            <option value="elementary" {{ $education->isEducationLevel('elementary') ? 'selected' : null }}>Elementary</option>
                            <option value="secondary" {{ $education->isEducationLevel('secondary') ? 'selected' : null }}>Secondary</option>
                            <option value="vocational" {{ $education->isEducationLevel('vocational') ? 'selected' : null }}>Vocational / Trade Course</option>
                            <option value="college" {{ $education->isEducationLevel('college') ? 'selected' : null }}>College</option>
                            <option value="graduate studies" {{ $education->isEducationLevel('graduate_studies') ? 'selected' : null }}>Graduate Studies</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Name of School&nbsp;<small>Write in full</small></label>
                    <div class="form-group col-sm-6">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="school[]" value="{{ $education->school }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Degree / Course&nbsp;<small>Write in full</small></label>
                    <div class="form-group col-sm-6">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="degree_course[]" value="{{ $education->degree_course }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Year Graduated</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="year_graduated[]" value="{{ $education->year_graduated }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Inclusive Dates</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group input-daterange">
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="education_start[]" placeholder="Date started"value="{{ $education->start }}" />
                            <span class="input-group-addon">to</span>
                            <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="education_end[]" placeholder="Date ended" value="{{ $education->end }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Highest Grade / Level / Units Earned <small>if not graduated</small></label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                            <input type="text" class="form-control" name="highest_level[]" value="{{ $education->highest_level }}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Scholarship / Academic Honors Received</label>
                    <div class="form-group col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" name="academic_honors[]" value="{{ $education->academic_honors }}" />
                        </div>
                    </div>
                </div>
                <hr class="alt">
            </div>
        @endforeach
    @endif
@endsection

@include('employee.create_partials.pds-panel', [
    'panel_body_id' => 'education_background_panel',
    'clone_element' => 'educationalBackground',
    'title' => 'Educational Background',
    'as' => 'educational_background'
])

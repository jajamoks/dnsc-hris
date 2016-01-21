@section('civil_panel_content')
    @if (!isset($employee) or $employee->employee_civil_services->isEmpty())
        <div id="civilServiceEligibility" class="parent">
            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label class="control-label">Career Service / RA 1080 (BOARD / BAR Under Special Laws / CES / CSEE</label>
                        <div class="form-group">
                            <div class="input-group mar-btm">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input spellcheck="true" type="text" class="form-control" name="cs_career_service[]" placeholder="Title" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Rating</label>
                        <div class="form-group">
                            <div class="input-group mar-btm">
                                <span class="input-group-addon"><b>%</b></span>
                                <input type="text" class="form-control" name="cs_rating[]" placeholder="Rating" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Date of examination</label>
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="cs_examination_date[]" placeholder="Examination date" value="{{ NULL }}" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label class="control-label">Place of examination</label>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                <input type="text" class="form-control" name="cs_examination_place[]" placeholder="Examination place" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">License <i>if applicable</i></label>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                <input type="text" class="form-control" name="cs_license_number[]" placeholder="License number" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Date Released</label>
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="cs_release_date[]" placeholder="Date released" value="{{ NULL }}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="alt">
        </div>
    @else
        @foreach($employee->employee_civil_services as $civil_service)
            <div id="civilServiceEligibility" class="parent">
                <input type="hidden" name="employee_civil_service_id[]" value="{{ $civil_service->id }}"/>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label class="control-label">Career Service / RA 1080 (BOARD / BAR Under Special Laws / CES / CSEE</label>
                            <div class="form-group">
                                <div class="input-group mar-btm">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input spellcheck="true" type="text" class="form-control" name="cs_career_service[]" placeholder="Title" value="{{ $civil_service->career_service }}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Rating</label>
                            <div class="form-group">
                                <div class="input-group mar-btm">
                                    <span class="input-group-addon"><b>%</b></span>
                                    <input type="text" class="form-control" name="cs_rating[]" placeholder="Rating" value="{{ $civil_service->rating }}"/>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Date of examination</label>
                            <div class="form-group">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="cs_examination_date[]" placeholder="Examination date" value="{{ $civil_service->examination_date or NULL }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label class="control-label">Place of examination</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                    <input type="text" class="form-control" name="cs_examination_place[]" placeholder="Examination place" value="{{ $civil_service->examination_place }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">License <i>if applicable</i></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    <input type="text" class="form-control" name="cs_license_number[]" placeholder="License number" value="{{ $civil_service->license_number }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Date Released</label>
                            <div class="form-group">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="cs_release_date[]" placeholder="Date released" value="{{ $civil_service->release_date or NULL }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="alt">
            </div>
        @endforeach
    @endif
@endsection

@include('employee.create_partials.pds-panel', [
    'panel_body_id' => 'civil-service-panel',
    'clone_element' => 'civilServiceEligibility',
    'title' => 'Civil Service Eligibility',
    'as' => 'civil'
])

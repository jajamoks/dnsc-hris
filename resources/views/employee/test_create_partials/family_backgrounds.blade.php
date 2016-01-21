<div class="panel panel-bordered">
    <!--Panel heading-->
    <div class="panel-heading">
        <div class="panel-control">
            <button class="btn btn-default" data-target="#spouse-panel" data-toggle="collapse"><i class="fa fa-chevron-down"></i></button>
        </div>
        <h3 class="panel-title">{{ trans('pds.spouse-information') }}</h3>
    </div>

    <!--Panel body-->
    <div id="spouse-panel" class="collapse in">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.first-name') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[first_name]" placeholder="First name" value="{{ isset($employee) ? $employee->employee_spouse->first_name : old('employee_spouse.first_name') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.middle-name') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[middle_name]" placeholder="Middle name" value="{{ isset($employee) ? $employee->employee_spouse->middle_name : old('employee_spouse.middle_name') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.surname') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[last_name]" placeholder="Last name" value="{{ isset($employee) ? $employee->employee_spouse->last_name : old('employee_spouse.last_name') }}" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.occupation') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[occupation]" placeholder="Occupation" value="{{ isset($employee) ? $employee->employee_spouse->occupation : old('employee_spouse.occupation') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <label class="control-label">Employer / Business Name</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[employer_business_name]" placeholder="Employer / Business name" value="{{ isset($employee) ? $employee->employee_spouse->employer_business_name : old('employee_spouse.employer_business_name') }}" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label class="control-label">Employer / Business address</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[business_address]" placeholder="Business address" value="{{ isset($employee) ? $employee->employee_spouse->business_address : old('employee_spouse.business_address') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.telephone') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
                            <input type="text" class="form-control " name="employee_spouse[telephone_number]" placeholder="Telephone number" value="{{ isset($employee) ? $employee->employee_spouse->telephone_number : old('employee_spouse.telephone_number') }}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-bordered" id="childInformationPanel">

    <!--Panel heading-->
    <div class="panel-heading">
        <div class="panel-control">
            <button class="add-field btn btn-default add-tooltip" data-append="#childrenPanel" data-target="#childInformation" data-toggle="tooltip" data-original-title="Add child"><i class="fa fa-plus"></i></button>
            <button class="btn btn-default" data-target="#children-panel" data-toggle="collapse"><i class="fa fa-chevron-down"></i></button>
        </div>
        <h6 class="panel-title">{{ trans('pds.children') }}</h6>
    </div>

    <!--Panel body-->
    <div id="childrenPanel" class="collapse in">
        <div class="panel-body">
            @if (!isset($employee) or $employee->employee_child->isEmpty())
                <div id="childInformation" class="childInformation row parent">
                    <button class="remove btn btn-default col-xs-1"><i class="fa fa-times"></i> Remove</button>
                    {{-- <input type="hidden" name="employee_child_id[]"/> --}}
                    <div class="col-md-7">
                        <div class="form-group">
                            <div class="input-group mar-btm">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control " name="employee_child[name][]" placeholder="Child name"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_child[birthday][]" placeholder="Date of birth"/>
                            </div>
                        </div>
                    </div>
                </div>
            @else
                @foreach($employee->employee_child as $child)
                <div id="childInformation" class="row parent">
                    <button class="remove btn btn-default col-xs-1"><i class="fa fa-times"></i> Remove</button>
                    <input type="hidden" name="employee_child_id[]" value="{{ $child->id }}" />
                    <div class="col-md-7">
                        <div class="form-group">
                            <div class="input-group mar-btm">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control " name="employee_child[][name]" placeholder="Child name" value="{{ $child->name }}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control " data-date-format="yyyy-mm-dd" data-provide="datepicker" name="employee_child[][birthday]" placeholder="Date of birth" value="{{ $child->birthday }}"/>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @endif
        </div>
    </div>
</div>

<div class="panel panel-bordered">

    <!--Panel heading-->
    <div class="panel-heading">
        <div class="panel-control">
            <button class="btn btn-default" data-target="#parent-panel" data-toggle="collapse"><i class="fa fa-chevron-down"></i></button>
        </div>
        <h3 class="panel-title">{{ trans('pds.parents-information') }}</h3>
    </div>

    <!--Panel body-->
    <div id="parent-panel" class="collapse in">
        <div class="panel-body">
            <div class="row">
                @if(isset($employee))
                <input type="hidden" name="employee_parents[1][id]" value="{{ $employee->employee_parents()->father()->id }}" />
                @endif
                <input type="hidden" name="employee_parents[1][relationship]" value="father" />
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[1][first_name]" placeholder="Father's first name" value="{{ isset($employee) ? $employee->employee_parents()->father()->first_name : old('employee_parents.1.first_name') }}" required />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[1][middle_name]" placeholder="Father's middle name" value="{{ isset($employee) ? $employee->employee_parents()->father()->middle_name : old('employee_parents.1.middle_name') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[1][last_name]" placeholder="Father's last name" value="{{ isset($employee) ? $employee->employee_parents()->father()->last_name : old('employee_parents.1.last_name') }}" required />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                @if(isset($employee))
                <input type="hidden" name="employee_parents[0][id]" value="{{ $employee->employee_parents()->mother()->id }}" />
                @endif
                <input type="hidden" name="employee_parents[0][relationship]" value="mother" />
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[0][first_name]" placeholder="Mother's first name" value="{{ isset($employee) ? $employee->employee_parents()->mother()->first_name : old('employee_parents.0.first_name') }}" required />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[0][middle_name]" placeholder="Mother's middle name" value="{{ isset($employee) ? $employee->employee_parents()->mother()->middle_name : old('employee_parents.0.middle_name') }}" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="employee_parents[0][last_name]" placeholder="Mother's last name" value="{{ isset($employee) ? $employee->employee_parents()->mother()->last_name : old('employee_parents.0.last_name') }}" required />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

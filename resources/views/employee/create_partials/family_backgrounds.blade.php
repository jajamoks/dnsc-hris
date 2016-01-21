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
                            <input type="text" class="form-control " name="spouse_firstname" placeholder="First name" @if(isset($employee)) value="{{ $employee->employee_spouse->first_name or '' }}" @endif/>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.middle-name') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="spouse_middlename" placeholder="Middle name" @if(isset($employee)) value="{{ $employee->employee_spouse->middle_name or null }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.surname') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="spouse_surname" placeholder="Last name" @if(isset($employee)) value="{{ $employee->employee_spouse->last_name or null }}" @endif />
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
                            <input type="text" class="form-control " name="spouse_occupation" placeholder="Occupation" @if(isset($employee)) value="{{ $employee->employee_spouse->occupation or '' }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <label class="control-label">Employer / Business Name</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                            <input type="text" class="form-control " name="spouse_employer_business_name" placeholder="Employer / Business name" @if(isset($employee)) value="{{ $employee->employee_spouse->employer_business_name or '' }}" @endif />
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
                            <input type="text" class="form-control " name="spouse_employer_business_address" placeholder="Business address" @if(isset($employee)) value="{{ $employee->employee_spouse->business_address or '' }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">{{ trans('pds.telephone') }}</span></label>
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
                            <input type="text" class="form-control " name="spouse_business_telephone_number" placeholder="Telephone number" @if(isset($employee)) value="{{ $employee->employee_spouse->telephone_number or '' }}" @endif />
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
                    <input type="hidden" name="employee_child_id[]"/>
                    <div class="col-md-7">
                        <div class="form-group">
                            <div class="input-group mar-btm">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control " name="child_name[]" placeholder="Child name"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="child_birthday[]" placeholder="Date of birth"/>
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
                                <input type="text" class="form-control " name="child_name[]" placeholder="Child name" value="{{ $child->name }}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control " data-date-format="yyyy-mm-dd" data-provide="datepicker" name="child_birthday[]" placeholder="Date of birth" value="{{ $child->birthday }}"/>
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
                @if(isset($employee) && !$employee->employee_parents->isEmpty())
                <input type="hidden" name="father_id" value="{{ $employee->employee_parents()->father()->id }}" />
                @endif
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="father_firstname" placeholder="Father's first name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->father()->first_name }}" @endif/>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="father_middlename" placeholder="Father's middle name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->father()->middle_name }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="father_surname" placeholder="Father's last name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->father()->last_name }}" @endif/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                @if(isset($employee))
                <input type="hidden" name="mother_id" value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->mother()->id }}" />
                @endif
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="mother_firstname" placeholder="Mother's first name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->mother()->first_name }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="mother_middlename" placeholder="Mother's middle name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->mother()->middle_name }}" @endif />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group mar-btm">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control " name="mother_surname" placeholder="Mother's last name" @if(isset($employee)) value="{{ $employee->employee_parents->isEmpty() ? null : $employee->employee_parents()->mother()->last_name }}" @endif />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

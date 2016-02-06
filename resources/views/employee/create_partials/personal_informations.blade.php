<div class="row">
    <div class="col-md-3">
        <label class="control-label">{{ trans('pds.photo') }} <strong><small class="text-danger">(Max 1.5mb)</small></strong></label>
        <div class="fileupload fileupload-new" data-provides="fileupload">
            <div class="fileupload-preview thumbnail">
                <img data-src="holder.js/100%x300" alt="holder">
            </div>
            <div class="row">
                <span class="btn btn-success btn-file btn-block">
                    <span class="fileupload-new">Select / </span>
                    <span class="fileupload-exists">Change</span>
                    <input type="file" name="employee_photo">
                </span>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.first-name') }} <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-star fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_firstname" placeholder="First name" value="{{ $employee->first_name or null }}" required />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.middle-name') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-star fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_middlename" placeholder="Middle name" value="{{ $employee->middle_name or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.surname') }} <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-star fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_surname" placeholder="Last name" value="{{ $employee->surname or null }}" required />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Name extension (e.g. Jr., Sr.)</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="employee_name_extension" placeholder="Name extension" value="{{ $employee->name_extension or null }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.birthday') }} <span class="text-danger">*</span></label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" class="form-control " name="employee_birthday" placeholder="Date of Birth" value="{{ $employee->birthday or NULL }}">
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.birthplace') }} <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                        <input type="text" class="form-control " name="employee_birthplace" placeholder="Place of Birth" value="{{ $employee->birthplace or null }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <label class="control-label">{{ trans('pds.sex') }} <span class="text-danger">*</span></label>
                <select class="form-control " name="employee_sex" required>
                    <option value="male" {{ isset($employee) ? ($employee->isMale() ? 'selected' : '') : null }}>Male</option>
                    <option value="female" {{ isset($employee) ? ($employee->isFemale() ? 'selected' : '') : null }}>Female</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="control-label">{{ trans('pds.civil-status') }} <span class="text-danger">*</span></label>
                <select class="form-control " name="employee_civil_status" required>
                    <option value="single" {{ isset($employee) ? ($employee->isStatus('single') ? 'selected' : '') : null }} >Single</option>
                    <option value="married" {{ isset($employee) ? ($employee->isStatus('married') ? 'selected' : '') : null }} >Married</option>
                    <option value="annulled" {{ isset($employee) ? ($employee->isStatus('annulled') ? 'selected' : '') : null }} >Annulled</option>
                    <option value="widowed" {{ isset($employee) ? ($employee->isStatus('widowed') ? 'selected' : '') : null }} >Widowed</option>
                    <option value="separated" {{ isset($employee) ? ($employee->isStatus('separated') ? 'selected' : '') : null }} >Separated</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="control-label">{{ trans('pds.citizenship') }} <span class="text-danger">*</span></label>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-flag"></i></span>
                        <input type="text" class="form-control " name="employee_citizenship" placeholder="Citizenship" value="{{ $employee->citizenship or null }}" required />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.height') }} (m)</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-male"></i></span>
                        <input type="text" class="form-control " name="employee_height" placeholder="Height in meters" value="{{ $employee->height or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.weight') }} (kg)</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                        <input type="text" class="form-control " name="employee_weight" placeholder="Weight in kilograms" value="{{ $employee->weight or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.blood-type') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-plus-square"></i></span>
                        <input type="text" class="form-control " name="employee_blood_type" placeholder="Blood type" value="{{ $employee->blood_type or null }}" />
                    </div>
                </div>
            </div>
        </div>
        <hr class="alt">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">GSIS ID No. </label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input class="form-control" name="employee_gsis_id" placeholder="GSIS ID Number" value="{{ $employee->gsis_id or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">PAG-IBIG ID No. </label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input class="form-control " name="employee_pagibig_id" placeholder="PAGIBIG ID Number" value="{{ $employee->pagibig_id or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">PHILHEALTH ID No. </label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input class="form-control " name="employee_philhealth_id" placeholder="PHILHEALTH ID Number" value="{{ $employee->philhealth or null }}" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">SSS ID No. </label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input class="form-control" name="employee_sss_id" placeholder="SSS ID Number" value="{{ $employee->sss_id or null }}" />
                    </div>
                </div>
            </div>
        </div>
        <br>

        <input type="hidden" name="residential_employee_address_id" value="{{ isset($employee) ? $employee->employee_address()->residential()->id : null }}" />
        <div class="row">
            <div class="col-md-12">
                <label class="control-label">{{ trans('pds.residential-address') }} <span class="text-danger">*</span></label>
                <div class="form-group">
                    <textarea placeholder="Residential address" rows="5" class="form-control" name="employee_residential_address">{{ isset($employee) ? $employee->employee_address()->residential()->address : null }}</textarea>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">ZIP Code</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-bolt"></i></span>
                        <input type="text" class="form-control " name="residential_zip_code" placeholder="ZIP Code" value="{{ isset($employee) ? $employee->employee_address()->residential()->zip_code : null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.telephone') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input type="text" class="form-control " name="residential_telephone_number" placeholder="Telephone number" value="{{ isset($employee) ? $employee->employee_address()->residential()->telephone_number : null }}" />
                    </div>
                </div>
            </div>
        </div>

        <hr class="alt"/>

        <input type="hidden" name="permanent_employee_address_id" value="{{ isset($employee) ? $employee->employee_address()->permanent()->id : null }}" />
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.permanent-address') }} <span class="text-danger">*</span></label>
                    <textarea placeholder="Permanent address" rows="5" class="form-control" name="employee_permanent_address">{{ isset($employee) ? $employee->employee_address()->permanent()->address : null }}</textarea>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">ZIP Code</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-bolt"></i></span>
                        <input type="text" class="form-control " name="permanent_zip_code" placeholder="ZIP Code" value="{{ isset($employee) ? $employee->employee_address()->permanent()->zip_code : null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.telephone') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input type="text" class="form-control " name="permanent_telephone_number" placeholder="Telephone number" value="{{ isset($employee) ? $employee->employee_address()->permanent()->telephone_number : null }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Cellphone no.</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input id="cellphone_number" type="text" class="form-control " name="employee_cellphone_number" placeholder="Cellphone number" value="{{ $employee->cellphone_number or null }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Agency Employee No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input type="text" class="form-control " name="agency_employee_number" placeholder="Agency employee number" value="{{ $employee->agency_employee_number or null }}" required/>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">TIN No. </label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input class="form-control" name="employee_tin_number" placeholder="TIN number" value="{{ $employee->tin or null }}" />
                    </div>
                </div>
            </div>
        </div>

        <hr class="alt"/>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Community Tax Certificate No.</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input type="text" class="form-control " name="community_tax_cert_no" placeholder="" value="{{ $employee->community_tax_cert_no or null }}" required/>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Issued at</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                        <input class="form-control" name="community_tax_issued_at" value="{{ $employee->community_tax_issued_at or null }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Issued on</label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" class="form-control " name="community_tax_issued_on" value="{{ $employee->community_tax_issued_on or NULL }}">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

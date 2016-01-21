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
                    <input type="file" name="employee[photo]">
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
                        <input type="text" class="form-control" name="employee[first_name]" placeholder="First name" value="{{ $employee->first_name or old('employee.first_name') }}" required />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.middle-name') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-star fa-user"></i></span>
                        <input type="text" class="form-control" name="employee[middle_name]" placeholder="Middle name" value="{{ $employee->middle_name or old('employee.middle_name') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.surname') }} <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-star fa-user"></i></span>
                        <input type="text" class="form-control" name="employee[surname]" placeholder="Last name" value="{{ $employee->surname or old('employee.surname') }}" required />
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
                        <input type="text" class="form-control" name="employee[name_extension]" placeholder="Name extension" value="{{ $employee->name_extension or old('employee.name_extension') }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.birthplace') }} <span class="text-danger">*</span></label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" class="form-control " name="employee[birthday]" placeholder="Date of Birth" value="{{ $employee->birthday or old('employee.birthday') }}" required>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.birthday') }} <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                        <input type="text" class="form-control " name="employee[birthplace]" placeholder="Place of Birth" value="{{ $employee->birthplace or old('employee.birthplace') }}" required />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <label class="control-label">{{ trans('pds.sex') }} <span class="text-danger">*</span></label>
                <select class="form-control " name="employee[sex]" required>
                    <option value="male" {{ isset($employee) ? ($employee->isMale() ? 'selected' : '') : null }}>Male</option>
                    <option value="female" {{ isset($employee) ? ($employee->isFemale() ? 'selected' : '') : null }}>Female</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="control-label">{{ trans('pds.civil-status') }} <span class="text-danger">*</span></label>
                <select class="form-control " name="employee[civil_status]" required>
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
                        <input type="text" class="form-control " name="employee[citizenship]" placeholder="Citizenship" value="{{ $employee->citizenship or old('employee.citizenship') }}" required />
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
                        <input type="text" class="form-control " name="employee[height]" placeholder="Height in meters" value="{{ $employee->height or old('employee.height') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.weight') }} (kg)</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                        <input type="text" class="form-control " name="employee[weight]" placeholder="Weight in kilograms" value="{{ $employee->weight or old('employee.weight') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.blood-type') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-plus-square"></i></span>
                        <input type="text" class="form-control " name="employee[blood_type]" placeholder="Blood type" value="{{ $employee->blood_type or old('employee.blood_type') }}" />
                    </div>
                </div>
            </div>
        </div>
        <hr class="alt">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">GSIS ID No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input id="gsis" class="form-control" name="employee[gsis_id]" placeholder="GSIS ID Number" value="{{ $employee->gsis_id or old('employee.gsis_id') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">PAG-IBIG ID No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input id="pagibig" class="form-control " name="employee[pagibig_id]" placeholder="PAGIBIG ID Number" value="{{ $employee->pagibig_id or old('employee.pagibig_id') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">PHILHEALTH ID No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input id="philhealth" class="form-control " name="employee[philhealth]" placeholder="PHILHEALTH ID Number" value="{{ $employee->philhealth or old('employee.philhealth') }}" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">SSS ID No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input id="sssID" class="form-control" name="employee[sss_id]" placeholder="SSS ID Number" value="{{ $employee->sss_id or old('employee.sss_id') }}" />
                    </div>
                </div>
            </div>
        </div>
        <br>

        <input type="hidden" name="employee_address[0][id]" value="{{ isset($employee) ? $employee->employee_address()->residential()->id : old('employee_address.0.id') }}" />
        <input type="hidden" name="employee_address[0][address_type]" value="residential" />
        <div class="row">
            <div class="col-md-12">
                <label class="control-label">{{ trans('pds.residential-address') }} <span class="text-danger">*</span></label>
                <div class="form-group">
                    <textarea required placeholder="Residential address" rows="5" class="form-control" name="employee_address[0][address]"  required>{{ isset($employee) ? $employee->employee_address()->residential()->address : old('employee_address.0.address') }}</textarea>
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
                        <input type="text" class="form-control " name="employee_address[0][zip_code]" placeholder="ZIP Code" value="{{ isset($employee) ? $employee->employee_address()->residential()->zip_code : old('employee_address.0.zip_code') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.telephone') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input type="text" class="form-control " name="employee_address[0][telephone_number]" placeholder="Telephone number" value="{{ isset($employee) ? $employee->employee_address()->residential()->telephone_number : old('employee_address.0.telephone_number') }}" />
                    </div>
                </div>
            </div>
        </div>

        <hr class="alt"/>

        <input type="hidden" name="employee_address[1][id]" value="{{ isset($employee) ? $employee->employee_address()->permanent()->id : old('employee_address.1.id') }}" />
        <input type="hidden" name="employee_address[1][residential_type]" value="permanent" />
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.permanent-address') }} <span class="text-danger">*</span></label>
                    <textarea placeholder="Permanent address" rows="5" class="form-control" name="employee_address[1][address]" required>{{ isset($employee) ? $employee->employee_address()->permanent()->address : old('employee_address.1.address') }}</textarea>
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
                        <input type="text" class="form-control " name="employee_address[1][zip_code]" placeholder="ZIP Code" value="{{ isset($employee) ? $employee->employee_address()->permanent()->zip_code : old('employee_address.1.zip_code') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">{{ trans('pds.telephone') }}</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                        <input type="text" class="form-control " name="employee_address[1][telephone_number]" placeholder="Telephone number" value="{{ isset($employee) ? $employee->employee_address()->permanent()->telephone_number : old('employee_address.1.telephone_number') }}" />
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
                        <input id="cellphone_number" type="text" class="form-control " name="employee[cellphone_number]" placeholder="Cellphone number" value="{{ $employee->cellphone_number or old('employee.cellphone_number') }}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Agency Employee No.</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input type="text" class="form-control " name="employee[agency_employee_number]" placeholder="Agency employee number" value="{{ $employee->agency_employee_number or old('employee.agency_employee_number') }}" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">TIN No. <span class="text-danger">*</span></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input id="tinNumber" class="form-control" name="employee[tin]" placeholder="TIN number" value="{{ $employee->tin or old('employee.tin') }}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

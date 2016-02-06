@extends('layouts.app')

@section('title', isset($leave) ? trans('system.update-regular-leave') : trans('system.apply-regular-leave'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('apply-regular-leave') !!}
@stop

@section('stylesheet')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
@stop

@section('content')
    <div class="row">
        @include('leaves.partials.leave_credits')
    </div>
    <div class="row">
        <div class="col-md-4">
            @include('partials.approval')
        </div>
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">CSC Form No. 6 (Revised 1985)</h3>
                </div>
                <form class="form-horizontal" method="POST" action="{{ isset($leave) ? '/leave/regular/'.$leave->id : '/leave/regular' }}">
                    <div class="panel-body">
                        {!! csrf_field() !!}
                        {!! isset($leave) ? method_field('PUT') : null !!}
                        <div class='row'>

                            <div class="form-group">

                                <label class="control-label col-md-3">Monthly salary</label>

                                <div class="col-md-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">&#8369;</span>
                                        <input type="text" name="salary" class="form-control" placeholder="Salary" value="{{ old('salary') }}" />
                                    </div>
                                </div> <!-- /.col -->

                            </div>

                            <div class="form-group">

                                <label class="control-label col-md-3">No. of working days applied for <span class="text-danger">*</span></label>

                                <div class="col-md-5">
                                    <input type="number" min='1' name="working_days_applied" class="form-control" value="{{ $leave->working_days_applied or old('working_days_applied') }}"/>
                                </div> <!-- /.col -->

                            </div>

                            <div class="form-group">

                                <label class="control-label col-md-3">Inclusive dates (mm/dd/yyyy) <span class="text-danger">*</span></label>

                                <div class="col-md-8">
                                    <div class="input-daterange input-group">
                                        <input type="text" class="form-control" name="start_date" placeholder="YYYY-MM-DD" value="{{ $leave->start_date or old('start_date') }}" />
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="form-control" name="end_date" placeholder="YYYY-MM-DD" value="{{ $leave->end_date or old('end_date') }}" />
                                    </div>
                                </div> <!-- /.col -->

                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3">Commutation <span class="text-danger">*</span></label>

                                <div class='col-md-9'>
                                    <div class="control-group">

                                        <div class="radio">
                                            <label class="form-radio form-icon">
                                                <input name="commutation" value="requested" type="radio" class="ace" {{ isset($leave) ? $leave->commutation == 'requested' ? 'checked' : null : null }}>
                                                <span class="lbl"> Requested</span>
                                            </label>
                                            <label class="form-radio form-icon">
                                                <input name="commutation" value="not requested" type="radio" class="ace" {{ isset($leave) ? $leave->commutation == 'not requested' ? 'checked' : null : null }}>
                                                <span class="lbl"> Not requested</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hr dotted"></div>

                            <div class="form-group">
                                <label class="control-label col-md-3">Type of Leave <span class="text-danger">*</span></label>

                                <div class='col-md-9'>
                                    <div class="control-group">

                                        @if (auth()->user()->employee->utility->can_file_vacation_leave)
                                        <div class="radio">
                                            <label class="form-radio form-icon">
                                                <input name="leave_type" value="vacation" type="radio" class="ace" {{ isset($leave) ? $leave->isLeaveType('vacation') ? 'checked' : null : null }}>
                                                Vacation
                                            </label>
                                        </div>
                                        @endif

                                        @if (auth()->user()->employee->utility->can_file_sick_leave)
                                        <div class="radio">
                                            <label class="form-radio form-icon">
                                                <input name="leave_type" value="sick" type="radio" class="ace" {{ isset($leave) ? $leave->isLeaveType('sick') ? 'checked' : null : null }}>
                                                Sick
                                            </label>
                                        </div>
                                        @endif

                                        <div class="radio">
                                            <label class="form-radio form-icon">
                                                <input name="leave_type" value="maternity" type="radio" class="ace" {{ isset($leave) ? $leave->isLeaveType('maternity') ? 'checked' : null : null }}>
                                                Maternity
                                            </label>
                                        </div>
                                    </div>
                                    <small class="help-block text-danger text-bold"></small>
                                </div>
                            </div>

                            <div id="additionalInformation" class="form-group" {{ isset($leave) ? '' : 'hidden' }}>
                                <label class="control-label col-md-3">Additional Information <span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <div class="control-group">
                                        <div id="vacation" {{ isset($leave) && $leave->isLeaveType('vacation') ? '' : 'hidden' }}>
                                            <div class="radio">
                                                <label class="form-radio form-icon active">
                                                    <input name="additional_info" value="within the philippines" type="radio" class="ace" {{ isset($leave) ? $leave->additional_info == 'within the philippines' ? 'checked' : null : null}}>
                                                    Within the Philippines
                                                </label>
                                            </div>

                                            <div class="radio">
                                                <label class="form-radio form-icon active">
                                                    <input name="additional_info" value="abroad" type="radio" class="ace" {{ isset($leave) ? $leave->additional_info == 'abroad' ? 'checked' : null : null }}>
                                                    Abroad
                                                </label>
                                            </div>
                                        </div>

                                        <div id="sick" {{ isset($leave) && $leave->isLeaveType('sick') ? '' : 'hidden' }}>
                                            <div class="radio">
                                                <label class="form-radio form-icon active">
                                                    <input name="additional_info" value="out patient" type="radio" class="ace" {{ isset($leave) ? $leave->additional_info == 'out patient' ? 'checked' : null : null }}>
                                                    Out patient
                                                </label>
                                            </div>

                                            <div class="radio">
                                                <label class="form-radio form-icon active">
                                                    <input name="additional_info" value="in hospital" type="radio" class="ace" {{ isset($leave) ? $leave->additional_info == 'in hospital' ? 'checked' : null : null }}>
                                                    In Hospital
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer text-right">
                        <button class="ladda-button btn btn-success" type="submit"><i class="fa fa-save"></i>&nbsp;{{ isset($leave) ? trans('system.update-regular-leave') : trans('system.apply-leave') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script>

$("input[name='leave_type']").on('change', function(){
    var value = this.value;
    var workingDaysApplied = $("input[name='working_days_applied']").val();
    $('#additionalInformation').show();
    // $("input[name='additional_info']").val(null);
    if (value == 'sick') {
        $('#vacation').hide();
        $('#sick').show();
        if (workingDaysApplied >= 3) {
            $('.help-block').show().html('Please attach your medical certificate.');
            return true;
        }
    } else if (value == 'vacation') {
        $('#sick').hide();
        $('#vacation').show();
    } else {
        $('#additionalInformation').hide();
    }
    $('.help-block').hide();
    return true;
});

$('.input-daterange').datepicker({
    format: "yyyy-mm-dd",
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
});
</script>
@stop

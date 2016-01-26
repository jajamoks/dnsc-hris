@extends('layouts.app')

@section('title', isset($leave) ? trans('system.update-special-leave') : trans('system.apply-special-leave'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('apply-special-leave') !!}
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
        <form method="POST" action="{{ isset($leave) ? '/leave/special/'.$leave->id : '/leave/special' }}">
            {!! isset($leave) ? method_field('PUT') : null !!}
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Pursuant to CSC MC No. 6 s. 1999</h3>
                </div>
                <div class="panel-body form-horizontal">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">

                                <label class="col-md-3">Type of Special Privilege applied for</label>

                                <div class="col-md-9">
                                    <div class="control-group form-block">
                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="personal milestone" {{ isset($leave) ? $leave->isLeaveType('personal milestone') ? 'checked' : null : null }}>
                                            <b>Personal Milestone</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.personal_milestone') }}
                                            </span>
                                        </label>

                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="filial obligation" {{ isset($leave) ? $leave->isLeaveType('filial obligation') ? 'checked' : null : null }}>
                                            <b>Filial Obligation</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.filial_obligation') }}
                                            </span>
                                        </label>

                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="personal transaction" {{ isset($leave) ? $leave->isLeaveType('personal transaction') ? 'checked' : null : null }}>
                                            <b>Personal Transaction</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.personal_transaction') }}
                                            </span>
                                        </label>

                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="parental obligation" {{ isset($leave) ? $leave->isLeaveType('parental obligation') ? 'checked' : null : null }}>
                                            <b>Parental Obligations</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.parental_obligations') }}
                                            </span>
                                        </label>

                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="domestic emergencies" {{ isset($leave) ? $leave->isLeaveType('domestic emergencies') ? 'checked' : null : null }}>
                                            <b>Domestic Emergencies</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.domestic_emergencies') }}
                                            </span>
                                        </label>

                                        <label class="form-checkbox form-icon active form-text">
                                            <input type="checkbox" name="type" value="calamity" {{ isset($leave) ? $leave->isLeaveType('calamity') ? 'checked' : null : null }}>
                                            <b>Calamity, Accident, Hospitalization leave</b>
                                            <span class="help-block">
                                                {{ Lang::get('leave_special_privileges.calamity') }}
                                            </span>
                                        </label>
                                    </div>
                                </div> <!-- /.col -->

                            </div>

                            <div class="form-group">

                                <label class="col-md-3">No. of working days applied</label>

                                <div class="col-md-3">
                                    <input type="number" class="form-control" name="number_of_days" min="1" value="{{ $leave->number_of_days or null }}"/>
                                </div> <!-- /.col -->
                            </div>

                            <div class="form-group">

                                <label class="col-md-3">Inclusive dates (mm/dd/yyyy)</label>

                                <div class="col-md-9">
                                    <div class="input-daterange input-group">
                                        <input type="text" class="form-control" name="date_from" placeholder="Start date" value="{{ $leave->date_from or null }}">
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="form-control" name="date_to" placeholder="End date" value="{{ $leave->date_to or null }}">
                                    </div>
                                </div> <!-- /.col -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <button type="submit" class="btn btn-success">{{ isset($leave) ? trans('system.update-leave') : trans('system.apply-leave') }}</button>
                </div>
            </div>
        </form>
    </div>
</div><!-- /.row -->
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script>
$('.input-daterange').datepicker({
    format: "yyyy-mm-dd",
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
});
</script>
@stop

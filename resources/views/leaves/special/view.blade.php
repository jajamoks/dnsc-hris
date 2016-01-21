@extends('layouts.app')

@section('title', 'View Special Leave Form')

@section('content')
<div class="row">
    <div class="col-md-4">
        @include('partials.approval')
    </div>
    <div class="col-md-8">
        <div class="panel">
            <div class="panel-heading">
            	<div class="panel-control">
					<a class="btn" href="/leave/special/{{ $leave->id }}/download"><i class="fa fa-download"></i> {{ trans('system.download') }}</a>
					<a target="_blank" class="btn" href="/leave/special/{{ $leave->id }}/preview"><i class="fa fa-print"></i> {{ trans('system.preview') }}</a>
		        </div>
                <h3 class="panel-title">Pursuant to CSC MC No. 6 s. 1999</h3>
            </div>
            <div class="panel-alert">
                <div class="alert-wrap in">
                    <div class="alert alert-{{ $leave->status }}" role="alert">
                        <button class="close" type="button"><i class="fa fa-times-circle"></i></button>

                        <div class="media-left">
                            <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                                <i class="fa fa-info-circle fa-lg"></i>
                            </span>
                        </div>
                        <div class="media-body">
                            <h4 class="alert-title">Leave Status</h4>
                            <p class="alert-message">This leave request is already <strong>{{ $leave->status }}!</strong></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body form-horizontal">
                <div class="row">
                    <div class="col-md-12">

                        <div class="form-group">

                            <label class="col-md-3">Name</label>

                            <div class="col-md-6">
                                <input readonly class="form-control" value="{{ $leave->employee->fullName() }}">
                            </div> <!-- /.col -->

                        </div>

                        <div class="form-group">

                            <label class="col-md-3">Staff/ Division</label>

                            <div class="col-md-6">
                                <input readonly class="form-control" value="{{ $leave->employee->user->department->name }}">
                            </div> <!-- /.col -->

                        </div>

                        <div class="form-group">

                            <label class="col-md-3">Position</label>

                            <div class="col-md-6">
                                <input readonly class="form-control" value="{{ $leave->employee->user->positions->first()->name }}">
                            </div> <!-- /.col -->

                        </div>

                        <div class="form-group">

                            <label class="col-md-3">Type of Special Privilege applied for</label>

                            <div class="col-md-9">
                                <div class="control-group form-block">
                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="personal milestone" {{ $leave->isLeaveType('personal milestone') ? 'checked' : null }}>
                                        <b>Personal Milestone</b>
                                        <span class="help-block">
                                            {{ Lang::get('leave_special_privileges.personal_milestone') }}
                                        </span>
                                    </label>

                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="filial obligation" {{ $leave->isLeaveType('filial obligation') ? 'checked' : null }}>
                                        <b>Filial Obligation</b>
                                        <span class="help-block">
                                            {{ Lang::get('leave_special_privileges.filial_obligation') }}
                                        </span>
                                    </label>

                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="personal transaction" {{ $leave->isLeaveType('personal transaction') ? 'checked' : null }}>
                                        <b>Personal Transaction</b>
                                        <span class="help-block">
                                            {{ Lang::get('leave_special_privileges.personal_transaction') }}
                                        </span>
                                    </label>

                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="parental obligation" {{ $leave->isLeaveType('parental obligation') ? 'checked' : null }}>
                                        <b>Parental Obligations</b>
                                        <span class="help-block">
                                            {{ Lang::get('leave_special_privileges.parental_obligations') }}
                                        </span>
                                    </label>

                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="domestic emergencies" {{ $leave->isLeaveType('domestic emergencies') ? 'checked' : null }}>
                                        <b>Domestic Emergencies</b>
                                        <span class="help-block">
                                            {{ Lang::get('leave_special_privileges.domestic_emergencies') }}
                                        </span>
                                    </label>

                                    <label class="form-checkbox form-icon active form-text">
                                        <input disabled type="checkbox" value="calamity" {{ $leave->isLeaveType('calamity') ? 'checked' : null }}>
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
                                <input readonly class="form-control" value="{{ $leave->number_of_days }}"/>
                            </div> <!-- /.col -->
                        </div>

                        <div class="form-group">

                            <label class="col-md-3">Inclusive dates</label>

                            <div class="col-md-9">
                                <div class="input-daterange input-group">
                                    <input readonly class="form-control" value="{{ $leave->date_from }}">
                                    <span class="input-group-addon">to</span>
                                    <input readonly class="form-control" value="{{ $leave->date_to }}">
                                </div>
                            </div> <!-- /.col -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.row -->

@stop

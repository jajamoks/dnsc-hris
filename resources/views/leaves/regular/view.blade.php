@extends('layouts.app')

@section('title', 'Regular Leave')

@section('content')
<div class="row">
	<div class="col-md-8">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-control">
					@can ('cancel', $leave)
						<a class="btn" onclick="cancelRegularLeave({{ $leave }})"><i class="fa fa-trash"></i> Cancel</a>
					@endcan
					@can ('reject', $leave)
						<a class="btn" onclick="rejectLeave({{ $leave }})"><i class="fa fa-remove"></i> Reject</a>
					@endcan
					@can ('approve', $leave)
						<a class="btn approve" href="/leave/regular/{{ $leave->id }}/approve"><i class="fa fa-check"></i> Approve</a>
					@endcan
					<a class="btn" href="/leave/regular/{{ $leave->id }}/download"><i class="fa fa-download"></i> {{ trans('system.download') }}</a>
					<a target="_blank" class="btn" href="/leave/regular/{{ $leave->id }}/preview"><i class="fa fa-print"></i> {{ trans('system.preview') }}</a>
		        </div>
				<div class="panel-title">
					{{ trans('system.leave-details') }}
				</div>
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
			<div class="panel-body">
				<form class="form-horizontal">
	                <div class="panel-body">
	                    <div class='row'>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">Name</label>

	                            <div class="col-md-7">
	                                <input readonly class="form-control" value='{{ $leave->employee->fullName() }}' required/>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">Position</label>

	                            <div class="col-md-7">
	                                <input readonly class="form-control" value="{{ $leave->employee->user->position }}" required/>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">Monthly salary</label>

	                            <div class="col-md-5">
	                                <div class="input-group">
	                                    <span class="input-group-addon"><i class="fa fa-usd"></i></span>
	                                    <input type="text" class="form-control" required />
	                                </div>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">Office/ Division</label>

	                            <div class="col-md-5">
	                                <input type="text" class="form-control" disabled value="{{ $leave->employee->user->department->name }}"/>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">No. of working days applied for</label>

	                            <div class="col-md-3">
	                                <input type="number" min='1' name="working_days_applied" class="form-control" value="{{ $leave->working_days_applied }}"/>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">

	                            <label class="control-label col-md-3">Inclusive dates (mm/dd/yyyy)</label>

	                            <div class="col-md-5">
	                                <div class="input-daterange input-group">
	                                    <input type="text" class="form-control" name="start_date" placeholder="YYYY-MM-DD" value="{{ $leave->start_date }}"/>
	                                    <span class="input-group-addon">to</span>
	                                    <input type="text" class="form-control" name="end_date" placeholder="YYYY-MM-DD" value="{{ $leave->end_date }}"/>
	                                </div>
	                            </div> <!-- /.col -->

	                        </div>

	                        <div class="form-group">
	                            <label class="control-label col-md-3"><b>Commutation</b></label>

	                            <div class='col-md-9'>
	                                <div class="control-group">

	                                    <div class="radio">
	                                        <label class="form-radio form-normal active">
	                                            <input disabled name="commutation" value="requested" type="radio" class="ace" {{ ($leave->commutation == 'requested') ? 'checked' : '' }}>
	                                            <span class="lbl"> Requested</span>
	                                        </label>
	                                        <label class="form-radio form-normal active">
	                                            <input disabled name="commutation" value="not requested" type="radio" class="ace" {{ ($leave->commutation == 'not requested') ? 'checked' : '' }}>
	                                            <span class="lbl"> Not requested</span>
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="hr dotted"></div>

	                        <div class="form-group">
	                            <label class="control-label col-md-3">Type of Leave</label>

	                            <div class='col-md-9'>
	                                <div class="control-group">

	                                    <div class="radio">
	                                        <label class="form-radio form-normal active">
	                                            <input disabled name="leave_type" value="vacation" type="radio" class="ace" {{ ($leave->leave_type == 'vacation') ? 'checked' : '' }}>
	                                            Vacation
	                                        </label>
	                                    </div>

	                                    <div class="radio">
	                                        <label class="form-radio form-normal active">
	                                            <input disabled name="leave_type" value="sick" type="radio" class="ace" {{ ($leave->leave_type == 'sick') ? 'checked' : '' }}>
	                                            Sick
	                                        </label>
	                                    </div>

	                                    <div class="radio">
	                                        <label class="form-radio form-normal active">
	                                            <input disabled name="leave_type" value="maternity" type="radio" class="ace" {{ ($leave->leave_type == 'maternity') ? 'checked' : '' }}>
	                                            Maternity
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>

	                        @unless (empty($leave->additional_info))
	                        <div class="form-group">
	                            <label class="control-label col-md-3">Addtional Information</label>

	                            <div class='col-md-9'>
	                                <div class="control-group">
	                                    <div class="radio">
	                                        <label class="form-radio form-normal active">
	                                            <input disabled type="radio" class="ace" checked />
	                                            {{ ucfirst($leave->additional_info) }}
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        @endunless
	                    </div>
	                </div>
	            </form>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		@include('partials.approval')
	</div>
</div>
@stop

@section('script')
<script type="text/javascript" src="/dist/js/controllers/LeaveController.js"></script>
@stop

@extends('layouts.app')

@section('title', 'Apply Travel Order')

@section('breadcrumbs')
    {!! Breadcrumbs::render('apply-travel-order') !!}
@stop

@section('stylesheet')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/dist/plugins/summernote/summernote.min.css">
@stop

@section('content')
<div class="row">
	<div class="col-md-4">
		@include('partials.approval')
	</div>
	<div class="col-md-8">
		<form action="/travel" method="POST">
			<div class="panel">
				<div class="panel-heading">
					<div class="panel-title">
						Application of Travel Order
					</div>
				</div>
				<div class="panel-body form-horizontal">
					{!! csrf_field() !!}
					<div class="form-group">
						<label class="col-sm-2 control-label">To <span class="text-danger">*</span></label>
						<div class="col-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input name="recipient" placeholder="Recipient" class="form-control" value="{{ auth()->user()->employee->full_name }}" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">RE: Travel to: <span class="text-danger">*</span></label>
						<div class="col-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-plane"></i></span>
								<input name="destination" placeholder="Destination" class="form-control" value="{{ old('destination') }}" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Purpose <span class="text-danger">*</span></label>
						<div class="col-sm-10">
							<textarea name="purpose" placeholder="State the purpose of your travel..." class="form-control">{{ old('purpose') }}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Inclusive dates <span class="text-danger">*</span></label>
						<div class="col-sm-7">
							<div class="input-daterange input-group">
                                <input type="text" class="form-control" name="date_from" placeholder="" value="{{ old('date_from') }}" required/>
                                <span class="input-group-addon">to</span>
                                <input type="text" class="form-control" name="date_to" placeholder="" value="{{ old('date_to') }}" required/>
                            </div>
						</div>
					</div>

					<div class="form-group">

					    <label class="control-label col-sm-2">Estimated expenses</label>

					    <div class="col-md-7">
					        <div class="input-group">
					            <span class="input-group-addon">&#8369;</span>
					            <input type="text" name="expenses" class="form-control" placeholder="Amount in peso" value="{{ old('expenses') }}" />
					        </div>
					    </div> <!-- /.col -->

					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">Details or Attachment</label>
						<div class="col-sm-10">
							<textarea name="details" id="details"></textarea>
							<span class="text-danger text-bold">Link of communication attachment or specify more details about the attachment</span>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Send travel order</button>
				</div>
			</div>
		</form>
	</div>
</div>
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript" src="/dist/plugins/summernote/summernote.min.js"></script>

<script type="text/javascript">
	(function(){
		$('.input-daterange').datepicker({
		    format: "yyyy-mm-dd",
		    todayBtn: "linked",
		    autoclose: true,
		    todayHighlight: true
		});

		$('#details').summernote({
			height: 200,
		});
	})();
</script>
@stop

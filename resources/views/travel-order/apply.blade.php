@extends('layouts.app')

@section('title', 'Apply Travel Order')

@section('breadcrumbs')
    {!! Breadcrumbs::render('apply-travel-order') !!}
@stop

@section('stylesheet')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
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
						<label class="col-sm-2 control-label">To</label>
						<div class="col-sm-9">
							<input name="recipient" placeholder="Recipient" class="form-control" value="{{ old('recipient') }}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">RE: Travel to:</label>
						<div class="col-sm-9">
							<input name="destination" placeholder="Destination" class="form-control" value="{{ old('destination') }}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Purpose</label>
						<div class="col-sm-9">
							<textarea name="purpose" placeholder="State the purpose of your travel..." class="form-control">{{ old('purpose') }}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Inclusive dates</label>
						<div class="col-sm-7">
							<div class="input-daterange input-group">
                                <input type="text" class="form-control" name="date_from" placeholder="" value="{{ old('date_from') }}" />
                                <span class="input-group-addon">to</span>
                                <input type="text" class="form-control" name="date_to" placeholder="" value="{{ old('date_to') }}" />
                            </div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Estimated expenses</label>
						<div class="col-sm-7">
							<input type="number" name="expenses" placeholder="Amount in Peso" class="form-control" value="{{ old('expenses') }}" >
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
<script type="text/javascript">
	(function(){
		$('.input-daterange').datepicker({
		    format: "yyyy-mm-dd",
		    todayBtn: "linked",
		    autoclose: true,
		    todayHighlight: true
		});
	})();
</script>
@stop

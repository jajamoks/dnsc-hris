@extends('layouts.app')

@section('content')	
	<form method="POST" action="">
		{!! method_field('PUT') !!}
		{!! csrf_field() !!}
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="fa fa-cogs"></i> System
				</div>
			</div>
			<div class="panel-body">

			</div>
			<div class="panel-footer">
				<button type="submit" class="btn btn-success"><i class="fa fa-save"></i>&nbsp;Save settings</button>
			</div>
		</div>
	</form>
@stop
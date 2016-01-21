<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">Approval Hierarchy</h3>
	</div>
	<div class="list-group">
		@foreach ($approvals as $employee)
			@if ($employee)
				<a class="list-group-item list-item-lg {{ auth()->user()->cannot('show', $employee) ? 'unselectable' : null }}" href="{{ auth()->user()->can('show', $employee) ? '/employee/'.$employee->user->username : 'javascript:void(0)' }}">
					<img class="img-xs img-circle" src="{{ $employee->user->photo }}">
					<strong>&nbsp;{{ $employee->full_name }}</strong>
				</a>
			@endif
		@endforeach
	</div>
</div>

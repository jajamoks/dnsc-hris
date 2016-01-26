<div class="timeline">
	<!-- Timeline header -->
	<div class="timeline-header">
		<div class="timeline-header-title bg-success">Approval heirarchy</div>
	</div>
	@foreach ($approvals as $employee)
		@if ($employee)
			<div class="timeline-entry">
				<div class="timeline-stat">
					<div class="timeline-icon"><img src="{{ $employee->user->photo }}" alt="Image"></div>
				</div>
				<div class="timeline-label">
					<a href="/employee/{{ $employee->user->username }}" class="btn-link text-semibold text-lg">{{ $employee->full_name }}</a> <br>{{ $employee->user->position_title }}
				</div>
			</div>
		@endif
	@endforeach
</div>

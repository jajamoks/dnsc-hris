<div class="row">
	<div class="col-md-4">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="fa fa-code"></i> Hobby / Skills
				</div>
			</div>
			<div class="panel-body">
				<ol>
					@foreach($employee->employee_skills as $skill)
					<li>{{ $skill->skill }}</li>
					@endforeach
				</ol>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="fa fa-code"></i> Non academic distinction
				</div>
			</div>
			<div class="panel-body">
				<ol>
					@foreach($employee->employee_non_academics as $non_academic)
					<li>{{ $non_academic->name }}</li>
					@endforeach
				</ol>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-title">
					<i class="fa fa-code"></i> Organizations
				</div>
			</div>
			<div class="panel-body">
				<ol>
					@foreach($employee->employee_organizations as $organization)
					<li>{{ $organization->name }}</li>
					@endforeach
				</ol>
			</div>
		</div>
	</div>
</div>

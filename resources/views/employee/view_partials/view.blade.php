<div class="tab-base">

	<!--Nav tabs-->
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#personal"><i class="fa fa-user"></i> {{ trans('pds.personal') }}</a></li>
		<li><a data-toggle="tab" href="#family"><i class="fa fa-users"></i> {{ trans('pds.family') }}</a></li>
		<li><a data-toggle="tab" href="#education"><i class="fa fa-graduation-cap"></i> {{ trans('pds.education') }}</a></li>
		<li><a data-toggle="tab" href="#civil-service"><i class="fa fa-certificate"></i> {{ trans('pds.civil-service') }}</a></li>
		<li><a data-toggle="tab" href="#work"><i class="fa fa-briefcase"></i> {{ trans('pds.work-and-trainings') }}</a></li>
		<li><a data-toggle="tab" href="#training"><i class="fa fa-book"></i> Training</a></li>
		<li><a data-toggle="tab" href="#others"><i class="fa fa-asterisk"></i> {{ trans('pds.others') }}</a></li>
	</ul>


	<!--Tabs Content-->
	<div class="tab-content">
		<div id="personal" class="tab-pane fade active in">
			@include('employee.view_partials.personal_information')
		</div>
		<div id="family" class="tab-pane fade">
			@include('employee.view_partials.family_background')
		</div>
		<div id="education" class="tab-pane fade">
			@include('employee.view_partials.educational_background')
		</div>
		<div id="civil-service" class="tab-pane fade">
			@include('employee.view_partials.civil_service_eligibility')
		</div>
		<div id="work" class="tab-pane fade">
			@include('employee.view_partials.work_experience')
		</div>
		<div id="training" class="tab-pane fade">
			@include('employee.view_partials.training_programs')
		</div>
		<div id="others" class="tab-pane fade">
			@include('employee.view_partials.other_information')
		</div>
	</div>
</div>

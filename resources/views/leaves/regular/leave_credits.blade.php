<div class="row">
	<div class="col-md-6">
		<div class="panel media middle">
			<div class="media-left bg-success pad-all">
				<i class="fa fa-plane"></i>
			</div>
			<div class="media-body pad-all">
				<p class="text-2x mar-no">{{ auth()->user()->employee->leave_credit->regular_leave }}</p>
				<p class="text-muted mar-no">Regular Leave</p>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel media middle">
			<div class="media-left bg-primary pad-all">
				<i class="fa fa-user"></i>
			</div>
			<div class="media-body pad-all">
				<p class="text-2x mar-no">{{ auth()->user()->employee->leave_credit->force_leave }}</p>
				<p class="text-muted mar-no">Force Leave</p>
			</div>
		</div>
	</div>
</div>

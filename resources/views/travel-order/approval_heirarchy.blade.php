<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">Approval Hierarchy</h3>
	</div>
	<div class="panel-body">
		<div class="list-group">
			<a class="list-group-item list-item-lg">
				<img class="img-xs img-circle" src="{{ getProfilePhotoPath(auth()->user()->employee) }}">
				<strong>&nbsp;You</strong>
			</a>
			@unless (is_null($recommending_approval))
			<a class="list-group-item list-item-lg">
				<img class="img-xs img-circle" src="{{ getProfilePhotoPath($recommending_approval) }}">
				<strong>&nbsp;{{ $recommending_approval->fullName() }}</strong>
			</a>
			@endunless
			@unless (is_null($finance_director))
			<a class="list-group-item list-item-lg">
				<img class="img-xs img-circle" src="{{ getProfilePhotoPath($finance_director) }}">
				<strong>&nbsp;{{ $finance_director->fullName() }}</strong>
			</a>
			@endunless
			@unless (is_null($approved_by))
			<a class="list-group-item list-item-lg">
				<img class="img-xs img-circle" src="{{ getProfilePhotoPath($approved_by) }}">
				<strong>&nbsp;{{ $approved_by->fullName() }}</strong>
			</a>
			@endunless
		</div>
	</div>
</div>
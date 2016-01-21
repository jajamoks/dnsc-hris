<div class="panel">
	<div class="panel-heading">
		<div class="panel-title">
			Active users <span class="badge badge-success">{{ $sessions->count() }} online</span>
		</div>
	</div>
	@if ($sessions->isEmpty())
	<div v-else class="panel-alert">
		<div class="alert-wrap in">
			<div class="alert alert-danger" role="alert">
				<button class="close" type="button"><i class="fa fa-times-circle"></i></button>
				<div class="media-left">
					<span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
						<i class="fa fa-thumbs-o-up fa-lg"></i>
					</span>
				</div>
				<div class="media-body">
					<h4 class="alert-title">No active users</h4>
					<p class="alert-message">Only you is connected the website at this moment.</p>
				</div>
			</div>
		</div>
	</div>
	@else
	<div class="panel-body">
		<div class="list-group bg-trans">
			@foreach ($sessions as $session)
			<a href="/employee/{{ $session->user->username }}" class="list-group-item">
				<span class="badge badge-success badge-icon badge-fw pull-left"></span> {{ $session->user->display_name }}
			</a>
			@endforeach
		</div>
	</div>
	@endif
</div>

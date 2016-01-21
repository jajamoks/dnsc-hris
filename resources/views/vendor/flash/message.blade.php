@if (Session::has('flash_notification.message'))
	<div class="alert alert-{{ Session::get('flash_notification.level') }} media fade in">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<div class="media-left">
			<span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
				<i class="fa fa-{{ (Session::get('flash_notification.level') == 'success') ? 'thumbs-o-up' : 'warning' }} fa-lg"></i>
			</span>
		</div>
		<div class="media-body">
			<h4 class="alert-title">{{ trans('system.information') }}</h4>
			<p class="alert-message">{{ Session::get('flash_notification.message') }}</p>
		</div>
	</div>
@elseif (count($errors) > 0)
	<div class="alert alert-danger">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<strong>Whoops!</strong> There were some problems with your input.<br><br>
		<ul>
			@foreach ($errors->all() as $error)
				<li>{{ $error }}</li>
			@endforeach
		</ul>
	</div>
@endif

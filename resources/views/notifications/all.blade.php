@extends('layouts.app')

@section('title', trans('system.notifications'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('notifications') !!}
@stop

@section('content')
<notification-list inline-template>
	<div class="panel">
		<div class="panel-heading">
			<div v-if="notifications.length" class="panel-control">
	            <a @click="markAllRead" class="btn btn-success"><i class="fa fa-check"></i> Mark all as read</a>
	        </div>
			<h3 class="panel-title">{{ trans('system.notifications') }}</h3>
		</div>
		<div v-if="notifications.length" class="panel-body">
			<div class="timeline">
				<div class="timeline-header">
					<div class="timeline-header-title bg-success">{{ trans('system.recent') }}</div>
				</div>
				<div class="nano" style="height:350px">
					<div class="nano-content pad-no">
						<div v-for="notification in notifications | orderBy 'created_at' -1" class="timeline-entry">
							<div class="timeline-stat">
								<div class="timeline-icon bg-@{{ notification.color }}"><i class="fa fa-@{{ notification.icon }} fa-lg"></i></div>
								<div class="timeline-time">@{{ notification.created_at }}</div>
							</div>
							<div class="timeline-label">
								<h4 class="text-info text-lg">@{{ notification.title }}</h4>
								<a @click="readNotification(notification)" :href="notification.url"><p>@{{ notification.message }}</p></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
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
						<h4 class="alert-title">Notification Status</h4>
						<p class="alert-message">{{ trans('messages.no-notifications') }}</p>
					</div>
				</div>
			</div>
		</div>
		<div v-if="paginator.next_page_url" class="panel-footer">
			<hris-paginator :content.sync="notifications" :paginator.sync="paginator"></hris-paginator>
		</div>
	</div>
</notification-list>
@stop

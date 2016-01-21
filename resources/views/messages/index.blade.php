@extends('layouts.app')

@section('title', trans('system.messages'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('messages') !!}
@stop

@section('stylesheet')
<!--Chosen [ OPTIONAL ]-->
<link href="/dist/plugins/chosen/chosen.min.css" rel="stylesheet">
@stop

@section('includes')
	@include('messages.modal.create')
@stop

@section('content')
<chat-component inline-template>
	<div class="pad-all">
		<input v-model="searchThread" class="form-control input-lg" placeholder="{{ trans('messages.search-messages') }}..."/>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="panel">
				<div class="panel-heading">
					<div class="panel-control">
						<div class="btn-group">
							<button data-original-title="Delete all messages" @click="deleteAllMessage" class="btn btn-default add-tooltip"><i class="fa fa-trash"></i></button>

							<button data-original-title="Mark all as read" @click="markAllRead" class="btn btn-default add-tooltip"><i class="fa fa-check"></i></button>

							<button data-toggle="modal" href="#new-message" data-original-title="Send new message" class="btn btn-default add-tooltip"><i class="fa fa-plus"></i></button>
						</div>
					</div>
					<h3 class="panel-title"><i class="fa fa-envelope"></i>&nbsp;{{ trans('system.messages') }}</h3>
				</div>

				<div class="nano" style="height:450px">
					<div class="nano-content pad-no">
						<template v-if="!threads.length">
							@include('messages.partials.no-threads')
						</template>
						<!--Custom Content-->
						<!--===================================================-->
						<div class="list-group">
							<a data-toggle="panel-overlay" data-target="#chat-body" href="javascript:void(0)" @click="loadThread(thread)" v-for="thread in threads | orderBy 'created_at' -1 | filterBy searchThread " class="list-group-item refresh">
								<div class="media-left">
									<span v-if="thread.is_group" class="icon-wrap icon-wrap-sm icon-circle bg-success">
										<i class="fa fa-users fa-2x"></i>
									</span>
									<img v-else :src="thread.participants[0].photo" class="img-circle img-sm" />
								</div>
								<div class="media-right">
									<h5 class="list-group-item-heading text-bold">@{{ thread.group_name | limitBy 55 }}</h5>
									<p class="list-group-item-text">@{{ thread.messages[0].message }}</p>
									<small>@{{ thread.messages[0].created_at | date 'MMMM D YYYY hh:mm:ss' }}</small>
								</div>
							</a>
						</div>
						<!--===================================================-->
					</div>
				</div>

			</div>
		</div>
		<div class="col-md-8">
			<div class="panel">
				<!--Chat widget header-->
				<div class="panel-heading">
					<div class="panel-control">
						<div class="btn-group">
							<template v-if="messageGroup">
								<button type="button" class="btn btn-default" data-toggle="dropdown"><i class="fa fa-gear"></i></button>
								<ul class="dropdown-menu dropdown-menu-right">
									<li v-if="messageGroup.is_group"><a href="javascript:void(0)" @click="updateParticipants(messageGroup)"><i class="fa fa-user-plus"></i>&nbsp;Add participants</a></li>

									<li v-if="messageGroup.is_group"><a href="javascript:void(0)" @click="showParticipantsModal = true"><i class="fa fa-users"></i>&nbsp;Show participants</a></li>

									<li v-if="messageGroup.is_group && messageGroup.is_group_owner"><a href="javascript:void(0)" @click="renameThread(messageGroup)"><i class="fa fa-edit"></i>&nbsp;Rename conversation</a></li>

									<li><a href="javascript:void(0)" @click="deleteMessageGroup(messageGroup)"><i class="fa fa-trash"></i>&nbsp;Delete conversation</a></li>
								</ul>
							</template>
						</div>
					</div>
					<h3 @dblclick="renameThread(messageGroup)" class="panel-title unselectable" v-if="messageGroup">&nbsp;@{{ messageGroup.group_name | limitBy 55 }}</h3>
				</div>
				<div v-show="messageGroup" class="panel-footer">
					<form @submit.prevent="sendMessage">
						<div class="input-group">
							<input type="text" v-model="newMessage.message" placeholder="{{ trans('system.enter-message') }}..." class="form-control chat-input">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-mint btn-block" type="submit"><i class="fa fa-send"></i>&nbsp;{{ trans('system.send') }}</button>
							</span>
						</div>
					</form>
				</div>
				<!--Chat widget body-->
				<div id="chat-body">
					<div class="nano" style="height:400px">
						<div class="nano-content pad-all">
							<ul v-if="messageGroup" class="list-unstyled media-block">
								<li class="mar-btm" v-for="(index, message) in messages | filterBy searchThread | orderBy 'created_at' -1">
									<div :class="message.is_sender ? 'media-right' : 'media-left'">
										<img class="img-circle img-sm" :src="message.sender.photo"/>
									</div>
									<div class="media-body pad-hor" :class="message.is_sender ? 'speech-right' : null">
										<p v-if="index == 0 && message.users_who_already_read.length" class="text-light">
											<i class="fa fa-check"></i>&nbsp;
											<template v-if="messageGroup.is_group">
												Seen by
												<span v-for="user in message.users_who_already_read" v-text="user.display_name + ', '">
												</span>
											</template>
											<template v-if="!messageGroup.is_group && message.is_sender">Seen</template>
										</p>
										<div class="speech">
											<a v-if="!message.is_sender && messageGroup.is_group" :class="message.sender.employee ? null : 'unselectable'" :href="message.sender.employee ? '/employee/' + message.sender.username : 'javascript:void(0)'" class="media-heading">@{{ message.sender.display_name }}</a>
											<p>@{{ message.message }}</p>

											<p class="speech-time">

											<i class="fa" :class="message.is_sender ? null : message.is_read ? 'fa-check' : 'fa-clock-o'"></i>&nbsp;@{{ message.created_at | date 'MMMM D, YYYY hh:mm:ss' }}
											</p>
										</div>
									</div>
								</li>
							</ul>
							<template v-else>
								@include('messages.partials.no-thread-selected')
							</template>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	@include('messages.partials.participants')
</chat-component>
@stop

@section('script')
<!--Chosen [ OPTIONAL ]-->
<script src="/bower_components/chosen/chosen.jquery.min.js"></script>

<script type="text/javascript">
	$('#recipients').chosen({
	    width: '100%'
	}).trigger("liszt:updated");
</script>
@stop

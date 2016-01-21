<div id="thread-participants" class="modal fade" tabindex="-1">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" id="modal-alert">
			<div class="modal-header">
				<button class="close" data-dismiss="modal"><span>&times;</span></button>
				<h4 class="modal-title">@{{ messageGroup ? messageGroup.group_name : null }}</h4>
			</div>
			<div class="modal-body">
				<div v-if="messageGroup" class="list-group">
					<a :href="'/employee/' + participant.username" v-for="participant in messageGroup.participants" class="list-group-item list-item-sm" href="#">
						<div class="media-left">
							<img class="img-xs img-circle" :src="participant.photo" />
						</div>
						<div class="media-right">
							<h5 class="list-group-item-heading text-semibold">@{{ participant.employee ? participant.employee.full_name : participant.username }}</h5>
                            <p class="list-group-item-text">
                            	@{{ participant.positions[0] ? participant.positions[0].name : 'No position' }}
                            </p>
						</div>
					</a>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal"><i class="fa fa-remove"></i>&nbsp;Close</button>
			</div>
		</div>
	</div>
</div>

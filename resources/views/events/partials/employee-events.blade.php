<div id="employee-events" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-alert">
			<div class="modal-header">
				<button class="close" data-dismiss="modal"><span>&times;</span></button>
				<h4 class="modal-title">{{ trans('system.training-seminar') }}</h4>
			</div>
			<div class="modal-body">
		        <template v-if="trainings.length">
		        	<div class="well well-sm">
			            <h5>Legend</h5>
			            <ul class="list-unstyled">
			                <li><i class="fa fa-check"></i>&nbsp;Training or event is already done.</li>
			                <li><i class="fa fa-file-o"></i>&nbsp;Training will be included in the Personal Data Sheet.</li>
			            </ul>
			        </div>
			        <ul class="list-group">
			        	<a @click="toggleIncludeInPds(training)" v-for="training in trainings" class="list-group-item unselectable">
		                    <template v-if="training.pivot.include_in_pds === 1">
		                        <i class="fa fa-file-o"></i>&nbsp;
		                    </template>
		                    <template v-if="training.is_done">
		                        <i class="fa fa-check"></i>&nbsp;
		                    </template>
		                    @{{ training.title }}
		                    <span class="badge badge-@{{ training.is_done ? 'mint' : 'warning' }}">
		                        @{{ training.inclusive_dates }}
		                    </span>
		                </a>
			        </ul>
		        </template>
		        <div v-else class="well alert alert-default media fade in">
                    <div class="media-left">
                        <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                            <i class="fa fa-warning fa-lg"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <h4 class="alert-title">Heads up!</h4>
                        <p class="alert-message">{{ trans('messages.employee-no-events', ['name' => $employee->first_name]) }}</p>
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal"><i class="fa fa-remove"></i>&nbsp;Close</button>
			</div>
		</div>
	</div>
</div>

<employee-leave-credits-modal :show.sync="showEmployeeLeaveCreditsModal" :title="employee.full_name ? employee.full_name : ''" :effect="'zoom'">
	<div slot="modal-body">
	    <div class="modal-body leave-credit-modal-body">
	    	<form @submit.prevent="saveEmployeeLeaveCredits(employee)" method="POST">
				<div class="well tab-base pad-no">
					<div class="alert-wrap in">
		                <div class="alert alert-micro alert-success">
	                   		Press <code><strong>ENTER</strong></code> to save changes and persist it into the database.
		                </div>
		            </div>
					<!--Nav Tabs-->
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#leaveCredits">Leave Credits</a>
						</li>
						<li>
							<a data-toggle="tab" href="#accumulatedLeaves">Accumulated Leave</a>
						</li>
					</ul>

					<!--Tabs Content-->
					<div class="tab-content">
						<div id="leaveCredits" class="tab-pane fade active in">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-4 control-label">Force Leave</label>
									<div class="col-sm-5">
										<input type="text" v-model="employee.leave_credit.force_leave" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Special Leave</label>
									<div class="col-sm-5">
										<input type="text" v-model="employee.leave_credit.special_leave" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div id="accumulatedLeaves" class="tab-pane fade">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-4 control-label">Vacation Leave</label>
									<div class="col-sm-5">
										<input type="text" v-model="employee.accumulated_leave.vacation_leave" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Sick Leave</label>
									<div class="col-sm-5">
										<input type="text" name="accumulated_sick_leave" v-model="employee.accumulated_leave.sick_leave" class="form-control">
									</div>
								</div>
								{{-- <h2>@{{ totalAccumulatedLeave }}</h2> --}}
							</div>
						</div>
					</div>
				</div>
				<button type="submit" class="hidden"></button>
			</form>
		</div>
	</div>
    <div slot="modal-footer">
    	<div class="modal-footer">
    		<button class="btn btn-default" @click="showEmployeeLeaveCreditsModal = false"><i class="fa fa-remove"></i>&nbsp;Close</button>
    	</div>
    </div>
</employee-leave-credits-modal>

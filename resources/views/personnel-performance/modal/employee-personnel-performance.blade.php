<personnel-performance-modal :show.sync="showPersonnelPerformanceModal" :title="employee.full_name ? employee.full_name : ''" :effect="'zoom'">
	<div slot="modal-body">
	    <div class="modal-body personnel-performance-modal-body">
			<div class="well tab-base pad-no">
				<div class="alert-wrap in">
	                <div class="alert alert-micro alert-success">
                   		Press <code><strong>ENTER</strong></code> to save changes and persist it into the database.
	                </div>
	            </div>
				<!--Nav Tabs-->
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#pbb"><strong>Personal Base Bonus</strong></a>
					</li>
					<li v-if="user && user.is_faculty">
						<a data-toggle="tab" href="#qce"><strong>QCE</strong> (<small>for faculties only</small>)</a>
					</li>
				</ul>
				<!--Tabs Content-->
				<div class="tab-content">
					<div id="pbb" class="tab-pane fade active in">
						<form @submit.prevent="savePersonnelPerformance(personnel_performance)" class="form-horizontal" method="post">
							<div class="panel-body">
								<div class="form-group">
									<label class="col-lg-5 control-label">Strategic Functions <span class="text-bold">(40%)</span></label>
									<div class="col-lg-4">
										<div class="input-group mar-btm">
											<input type="number" min="0" max="40" class="form-control" v-model="personnel_performance.strategic_function">
											<span class="input-group-addon"><strong>%</strong></span>
										</div>
									</div>
								</div>
								<div class="form-group pad-btm">
									<label class="col-lg-5 control-label">Core Functions <span class="text-bold">(60%)</span></label>
									<div class="col-lg-4">
										<div class="input-group mar-btm">
											<input type="number" min="0" max="60" class="form-control" v-model="personnel_performance.core_function">
											<span class="input-group-addon"><strong>%</strong></span>
										</div>
									</div>
								</div>
								<hr />
								<div class="form-group pad-btm">
									<label class="col-lg-5 control-label text-bold text-center">Total Average
									</label>
									<label class="col-lg-6 control-label text-bold text-left">
										<span class="h1" :class="personnelPerformanceRating < 75 || personnelPerformanceRating > 100 ? 'text-danger' : 'text-success'">&nbsp;@{{ personnelPerformanceRating }} %</span>
									</label>
								</div>
							</div>
							<div class="text-right">
								<button type="submit" class="hidden btn btn-sm btn-success btn-block btn-labeled fa fa-save fa-lg">Save Personal Base Bonus</button>
							</div>
						</form>
					</div>
					<div v-if="user && user.is_faculty" id="qce" class="tab-pane fade">
						<form @submit.prevent="saveEmployeeQCE(employee_qce)" method="POST">
							<div class="panel-body">
								<div class="form-group">
									<label class="col-lg-6 control-label">Instruction</label>
									<div class="col-lg-6">
										<div class="input-group mar-btm">
											<input type="number" class="form-control" v-model="employee_qce.instruction">
										</div>
									</div>
								</div>
								<div class="form-group pad-btm">
									<label class="col-lg-6 control-label">Self</label>
									<div class="col-lg-6">
										<div class="input-group mar-btm">
											<input type="number" class="form-control" v-model="employee_qce.self">
										</div>
									</div>
								</div>
								<div class="form-group pad-btm">
									<label class="col-lg-6 control-label">Supervisor</label>
									<div class="col-lg-6">
										<div class="input-group mar-btm">
											<input type="number" class="form-control" v-model="employee_qce.supervisor">
										</div>
									</div>
								</div>
								<div class="form-group pad-btm">
									<label class="col-lg-6 control-label">Peers</label>
									<div class="col-lg-6">
										<div class="input-group mar-btm">
											<input type="number" class="form-control" v-model="employee_qce.peers">
										</div>
									</div>
								</div>
								<hr />
								<div class="form-group pad-btm">
									<label class="col-lg-6 control-label text-bold text-center">Total Points
									</label>
									<label class="col-lg-6 control-label text-bold text-left">
										<span class="h1" :class="{'text-danger': qceTotalPoints > 100, 'text-warning': qceTotalPoints < 75, 'text-success': qceTotalPoints > 74 && qceTotalPoints < 101}">&nbsp;@{{ qceTotalPoints }}</span>
									</label>
								</div>
							</div>
							<div class="text-right">
								<button type="submit" class="hidden btn btn-block btn-sm btn-success btn-labeled fa fa-save fa-lg">Save QCE</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div slot="modal-footer">
    	<div class="modal-footer">
    		<button class="btn btn-default" @click="showPersonnelPerformanceModal = false"><i class="fa fa-remove"></i>&nbsp;Close</button>
    	</div>
    </div>
</personnel-performance-modal>

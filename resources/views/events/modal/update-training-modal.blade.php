<update-training-modal :show.sync="showUpdateTrainingModal" :title="training.title" :effect="'zoom'">
	<div slot="modal-body">
	    <div class="modal-body">
	    	<form @submit.prevent="updateTraining(training)" role="form" class="form-horizontal" method="POST">
    			<div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Participants</label>
                    <div class="col-sm-8">
                        <select id="participants" v-model="participants" class="form-control" data-placeholder="Select participants..." multiple="true" required>
                            <option v-for="employee in employees" :value="employee.value">@{{ employee.text }}</option>
                        </select>
                    </div>
                </div>

	    		<div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Inclusive Dates</label>
                    <div class='col-sm-8'>
                        <div class="input-daterange input-group">
                            <input type="text" class="form-control" v-model="training.start" placeholder="Date started" required />
                            <span class="input-group-addon"><i class="ace-icon fa fa-arrow-right"></i></span>
                            <input type="text" class="form-control" v-model="training.end" placeholder="Date ended" required />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Event title</label>
                    <div class="col-sm-8">
                        <input type="text" v-model="training.title" placeholder="ex: Team Building" class="form-control" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Description</label>
                    <div class="col-sm-8">
                        <textarea v-model="training.description" class="form-control" placeholder="Add more info..."></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Place / Venue</label>
                    <div class="col-sm-8">
                        <textarea class="col-xs-12 form-control" v-model="training.venue" placeholder="Add a place?"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Sponsored by</label>
                    <div class='col-sm-8'>
                        <input type="text" class="form-control" v-model="training.sponsored_by" placeholder="Who sponsored this training?" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 no-padding-right control-label">Number of Hours</label>
                    <div class='col-sm-4'>
                        <input type="text" class="form-control" v-model="training.number_of_hours" placeholder="Number of hours" required />
                    </div>
                </div>

                <button type="submit" class="hidden"></button>
	    	</form>
		</div>
	</div>
    <div slot="modal-footer">
    	<div class="modal-footer">
    		<button @click="showUpdateTrainingModal = false" class="btn btn-default"><i class="fa fa-remove"></i>&nbsp;Close</button>
    		<button @click="updateTraining(training)" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;Update</button>
    	</div>
    </div>
</update-training-modal>

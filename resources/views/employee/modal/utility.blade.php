<employee-utility-modal :show.sync="showEmployeeUtilityModal" :title="employee.full_name" :effect="'zoom'">
	<div slot="modal-body">
	    <div class="modal-body">
	    	<form method="POST" role="form">

				<label class="form-checkbox form-icon" :class="{'active': utility.can_file_vacation_leave}">
					<input type="checkbox" v-model="utility.can_file_vacation_leave" :true-value="true" :false-value="false"> Can file vacation leave
				</label>

				<label class="form-checkbox form-icon" :class="{'active': utility.can_file_sick_leave}">
					<input type="checkbox" v-model="utility.can_file_sick_leave" :true-value="true" :false-value="false"> Can file sick leave
				</label>

				<label class="form-checkbox form-icon" :class="{'active': utility.can_file_special_leave}">
					<input type="checkbox" v-model="utility.can_file_special_leave" :true-value="true" :false-value="false"> Can file special leave
				</label>

				<label class="form-checkbox form-icon" :class="{'active': utility.can_file_travel_order}">
					<input type="checkbox" v-model="utility.can_file_travel_order" :true-value="true" :false-value="false"> Can file travel order
				</label>
	    	</form>
		</div>
	</div>
    <div slot="modal-footer">
    	<div class="modal-footer">
    		<button class="btn btn-default" @click="showEmployeeUtilityModal = false"><i class="fa fa-remove"></i>&nbsp;Close</button>
    		<button class="btn btn-success" @click="saveEmployeeUtility(employee)"><i class="fa fa-save"></i>&nbsp;Save Changes</button>
    	</div>
    </div>
</employee-utility-modal>

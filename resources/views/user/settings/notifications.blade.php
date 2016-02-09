<notification-settings inline-template>
	<form @submit.prevent="update(form)" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-3 control-label" for="">Notify via sms</label>
			<div class="col-sm-6">
				<div class="input-group mar-btm">
					<span class="input-group-addon">
						<label class="form-checkbox form-icon" :class="{'active': form.notify_via_sms}">
							<input type="checkbox" v-model="form.notify_via_sms">
						</label>
					</span>
					<input type="text" class="form-control" value="Receive notification via mobile" readonly="true">
				</div>
				<span class="text-danger">Update your mobile number in your Personal Data Sheet</span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label" for="">Notify via email</label>
			<div class="col-sm-6">
				<div class="input-group mar-btm">
					<span class="input-group-addon">
						<label class="form-checkbox form-icon" :class="{'active': form.notify_via_email}">
							<input type="checkbox" v-model="form.notify_via_email">
						</label>
					</span>
					<input type="text" class="form-control" value="Receive notification right at your email inbox" readonly="true">
				</div>
				<span class="text-danger">Update your email address in account settings</span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label" for="">Notify via system</label>
			<div class="col-sm-6">
				<div class="input-group mar-btm">
					<span class="input-group-addon">
						<label class="form-checkbox form-icon" :class="{'active': form.notify_via_system}">
							<input type="checkbox" v-model="form.notify_via_system">
						</label>
					</span>
					<input type="text" class="form-control" value="Receive notification" readonly="true">
				</div>
				<span class="text-danger"><span class="text-bold">Warning:</span> Turning this off will disable notification in the system. You will not be notified for any incoming notifications.</span>
			</div>
		</div>

		<hr class="alt" />

		<button type="submit" class="btn btn-default pull-right"><i class="fa fa-save"></i>&nbsp;Save settings</button>
	</form>
</notification-settings>

Vue.component('notification-settings', {

	ready() {

		this.settings();

	},

	data() {
		return {
			form: {
				notify_via_sms: false,
				notify_via_email: false,
				notify_via_system: false
			}
		}
	},

	methods: {

		settings() {
			this.$http.get('/api/settings')
				.then((response) => {
					console.log(response);
					this.form = response.data;
				});
		},

		update(form) {
			var vm = this;
			swal({
                title: "Update",
                text: "Do you want to update your notification settings?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Save changes",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, () => {
                vm.$http.put('/api/settings', form)
					.then((response) => {
						vm.form = response.data;
						swal('Success', 'Notification settings saved!', 'success');
					}).catch(() => {
						swal('Error', 'Something went wrong!', 'error');
					});
            });
			
		}

	}

});
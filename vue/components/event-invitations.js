Vue.component('hris-event-invitations', {

	ready() {
		this.getInvitations();
	},

	data() {
		return {
			invitations: []
		}
	},

	methods: {

		getInvitations() {
			this.$http.get('/api/calendar/invitations')
				.then(function(response) {
					this.invitations = response.data;
				});
		},

		going(training) {
			this.$http.put('/api/calendar/' + training.id + '/rvsp', {
					rvsp: 'going'
				})
				.then(function(response) {
					console.log(response.data);
				});
		}

	},

});
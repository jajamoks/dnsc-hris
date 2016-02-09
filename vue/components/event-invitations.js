import http from '../services/http.js';

Vue.component('hris-event-invitations', {

	ready() {

		this.getInvitations();

		this.getTrainingsAttended();

	},

	data() {

		return {

			trainingsAttended: [],

			invitations: [],

			filterTrainingsAttended: '',

			filterInvitations: '',

			attendants: 'not going',

			// Paginator variables

			trainingsAttendedPaginator: {},

			invitationsPaginator: {},

			loadMoreTrainingsAttended: false,

			loadMoreInvitations: false

		}

	},
	
	methods: {

		getTrainingsAttended() {
			var vm = this;
			http.get('/employee/' + USERNAME + '/trainings')
				.then((response) => {
					vm.trainingsAttendedPaginator = response.data;
					vm.trainingsAttended = response.data.data;
				});
		},

		getInvitations() {
			var vm = this;
			http.get('/api/calendar/invitations')
				.then((response) => {
					vm.invitationsPaginator = response.data;
					vm.invitations = response.data.data;
				});
		},

		rvsp(training, status) {
			var vm = this;
			http.put('/api/calendar/' + training.id + '/rvsp', {
					rvsp: status
				})
				.then((response) => {
					// training = response.data;
					vm.getInvitations();
					$.niftyNoty({
					    type: 'dark',
					    icon: 'fa fa-check',
					    message: 'Saved',
					    container: 'floating',
					    timer: 5000
					});
				});
		},

		attendAll() {
			var vm = this;
			var trainings = this.invitations.filter((training) => {
				return !training.is_going;
			});

			trainings.forEach((training) => {
				vm.rvsp(training, 'going');
			});
		},

		toggleIncludeInPds(training) {
			var vm = this;
			http.put('/api/calendar/' + training.id + '/toggle-include-in-pds')
				.then((response) => {
					training = response.data;
					vm.getTrainingsAttended();
					$.niftyNoty({
					    type: 'dark',
					    icon: 'fa fa-check',
					    message: 'Saved',
					    container: 'floating',
					    timer: 5000
					});
				});
        },

        getTrainingAttendants(training) {
        	return training.employees.filter((employee) => {
        		return employee.pivot.rvsp === 'going';
        	});
        }

	},

	filters: {

		filterByAttending(employees, value) {
			var vm = this;
			return employees.filter((employee) => {
				return employee.pivot.rvsp === value;
			});
		}

	},

	watch: {

        trainingsAttended() {
            var vm = this;
            this.$nextTick(() => {
                $('.nano').nanoScroller();

                $("#attending-trainings-nano").bind("scrollend", (e) => {
                    vm.loadMoreTrainingsAttended = true;
                    console.log('Loading more data.');
                });
            })
        },

        invitations() {
        	var vm = this;
            this.$nextTick(() => {
                $('.nano').nanoScroller();

                $("#invitations-nano").bind("scrollend", (e) => {
                    vm.loadMoreTrainingsAttended = true;
                    console.log('Loading more data.');
                });
            })
        },

		filterTrainingsAttended() {
			// this.trainingsAttended();
			var vm = this;
            this.$nextTick(() => {
                $('.nano').nanoScroller();

                $("#attending-trainings-nano").bind("scrollend", (e) => {
                    vm.loadMoreTrainingsAttended = true;
                    console.log('Loading more data.');
                });
            })
		},

		filterInvitations() {
			// this.invitations();
			var vm = this;
            this.$nextTick(() => {
                $('.nano').nanoScroller();

                $("#invitations-nano").bind("scrollend", (e) => {
                    vm.loadMoreTrainingsAttended = true;
                    console.log('Loading more data.');
                });
            })
		}  

    },

    components: {

        'trainings-attended-paginator': VuePaginator,

        'invitations-paginator': VuePaginator

    }

});
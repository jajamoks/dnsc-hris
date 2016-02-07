Vue.component('show-employee', {

    ready() {

        this.username = USERNAME;

    },

    data() {

        return {

            username: null,

            showEmployeeEvents: false,

            trainings: []

        }

    },

    methods: {

        getEmployeeEvents(username) {
            this.$http.get('/employee/' + username + '/trainings')
                .then(function(response) {
                    this.trainings = response.data;
                    this.showEmployeeEvents = true;
                });
        },

        toggleIncludeInPds(training) {
            this.$http.put('/api/calendar/' + training.id + '/toggle-include-in-pds')
                .success(function(data) {
                    training = data;
                    // this.getEmployeeEvents(USERNAME);
                    $.niftyNoty({
                        type: 'dark',
                        container: '.modal-dialog',
                        icon: 'fa fa-edit',
                        message: 'Training successfully updated!',
                        focus: false,
                        timer: 3000
                    });
                });
        }

    },

});

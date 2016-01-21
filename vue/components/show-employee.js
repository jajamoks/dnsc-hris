Vue.component('show-employee', {

    ready: function() {

        this.username = USERNAME;

    },

    data: function() {

        return {

            username: null,

            showEmployeeEvents: false,

            trainings: []

        }

    },

    methods: {

        getEmployeeEvents: function(username) {
            this.$http.get('/employee/' + username + '/trainings')
                .success(function(data) {
                    this.trainings = data;
                    this.showEmployeeEvents = true;
                });
        },

        toggleIncludeInPds: function(training) {
            if (training) {
                this.$http.put('/api/calendar/' + training.id + '/toggle-include-in-pds')
                    .success(function(data) {
                        training = data;
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
        }

    },

    watch: {

        'showEmployeeEvents': function() {
            if (this.showEmployeeEvents) {
                $('#employee-events').modal('show');
                this.showEmployeeEvents = false;
            }
        }

    }

});

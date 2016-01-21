Vue.component('hris-show-training', {

    ready: function() {

        this.getTraining();

    },

    data: function() {

        return {

            participants: [],

            employees: [],

            training: {
                title: '',
            },

            searchEmployee: '',

            // Modal

            showUpdateTrainingModal: false

        }

    },

    methods: {

        getTraining: function() {
            var self = this;
            this.$http.get('/api/calendar/' + TRAINING_ID)
                .success(function(res) {
                    this.training = res.training;
                    this.employees = res.employees;
                    this.participants = res.participants;
                });
        },

        editTraining: function() {
            this.showUpdateTrainingModal = true;
        },

        updateTraining: function(training) {
            this.$http.put('/api/calendar/' + training.id, {
                    training: training,
                    participants: this.participants
                })
                .success(function(data) {
                    this.training = data;
                    swal('Updated!', 'Training successfully updated.', 'success');
                });
        },

        deleteTraining: function(training) {
            var self = this;
            swal({
                title: "Are you sure?",
                text: "Do you really want to continue?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Delete",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function() {
                self.$http.post('/api/calendar/' + training.id)
                    .success(function() {
                        swal({
                            title: 'Training Deleted',
                            text: 'Training and seminar\'s deleted!',
                            type: 'success'
                        }, function() {
                            window.location.replace('/calendar');
                        })
                    });
            });
        }

    },

    components: {

        'update-training-modal': VueStrap.modal

    },

    watch: {
        'training': function() {
            this.$nextTick(function() {
                $('.input-daterange').datepicker({
                    format: "yyyy-mm-dd",
                    todayBtn: "linked",
                    autoclose: true,
                    todayHighlight: true
                });
            })
        },

        'participants': function() {
            $('#participants').chosen({
                width: '100%'
            });
        }

    }

});

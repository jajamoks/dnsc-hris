Vue.component('hris-positions', {

    ready: function() {
        this.getPositions();
    },

    data: function() {
        return {
            positions: [],
            position: {
                name: ''
            },
            showPositionModal: false,
            showAddUpdatePositionModal: false,
            editing: false
        }
    },

    methods: {

        getPositions: function() {
            this.$http.get('/api/positions')
                .success(function(data) {
                    this.positions = data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the positions at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });
        },

        showPosition: function(position) {
            this.position = position;
            this.showPositionModal = true;
        },

        editPosition: function(position) {
            this.editing = true;
            this.position = position;
            this.showAddUpdatePositionModal = true;
        },

        updatePosition: function(position) {
            if (position.name) {
                var self = this;
                this.$http.put('/positions/' + position.id, position)
                    .success(function(data) {
                        position = data;
                        swal({
                            title: 'Position updated',
                            text: data.name + ' successfully updated!',
                            type: 'success',
                            confirmButtonText: 'Close',
                        }, function() {
                            self.showAddUpdatePositionModal = false;
                        });
                    });
            }
        },

        deletePosition: function(position) {
            if (position.users.length) {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-info',
                    message: 'Cannot delete <strong>' + position.name + '</strong> because this position is not empty. Update it instead.',
                    container: 'floating',
                    timer: 8000
                });
            } else {
                var self = this;
                swal({
                    title: "Confirm deletion",
                    text: "Are you sure to delete " + position.name,
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Delete",
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                }, function() {
                    self.$http.delete('/positions/' + position.id + '/delete')
                        .success(function(data) {
                            // swal("Deleted!", "Position successfully deleted!", "success");
                            swal({
                                title: 'Deleted!',
                                text: 'Position successfully updated!',
                                type: 'success',
                                confirmButtonText: 'Close',
                            }, function() {
                                window.location.reload();
                            });
                            // self.positions.$remove(position);
                        }).error(function() {
                            swal("Unsuccessful!", "Position not deleted! Something went wrong.", "error");
                        });
                });
            }
        },

        savePosition: function(position) {
            var self = this;
            this.$http.post('/api/positions', position)
                .success(function(data) {
                    swal({
                        title: 'Position added',
                        text: data.name + ' successfully added!',
                        type: 'success',
                        confirmButtonText: 'Okay',
                    }, function() {
                        window.location.reload();
                    });
                }).error(function() {
                    swal("Unsuccessful", "Oopss! Position not added. Please try again.", "error");
                });
        }
    },

    watch: {

        'positions': function() {
            this.$nextTick(function() {
                console.log("Datatable here...");
                $('table').dataTable();
            });
        },

        'editing': function() {
            if (!this.editing) {
                this.position = {
                    name: ''
                }
            }
        },
    },

    components: {

        'add-update-position-modal': VueStrap.modal,

        'show-position-modal': VueStrap.modal

    }

});

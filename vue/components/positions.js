Vue.component('hris-positions', {

    ready() {
        this.getPositions();
    },

    data() {
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

        getPositions() {
            this.$http.get('/api/positions')
                .then(function(response) {
                    this.positions = response.data;
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

        showPosition(position) {
            this.position = position;
            this.showPositionModal = true;
        },

        editPosition(position) {
            this.editing = true;
            this.position = position;
            this.showAddUpdatePositionModal = true;
        },

        updatePosition(position) {
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

        deletePosition(position) {
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

        savePosition(position) {
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

        positions() {
            this.$nextTick(function() {
                console.log("Datatable here...");
                $('table').dataTable();
            });
        },

        editing() {
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

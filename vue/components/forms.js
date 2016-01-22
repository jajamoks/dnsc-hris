Vue.component('hris-forms', {

    ready: function() {

        this.getForms();

    },

    data: function() {
        return {

            forms: []

        }
    },

    methods: {

        getForms: function() {
            this.$http.get('/api/forms')
                .success(function(data) {
                    this.forms = data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the forms at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });;
        },

        deleteForm: function(form) {
            var self = this;

            if (form.restricted) {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-warning',
                    message: 'Cannot delete form because it used by the system.',
                    container: 'floating',
                    timer: 5000
                });
            } else {
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this form after deleting.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                }, function() {
                    self.$http.delete('/forms/' + form.id)
                        .success(function(data) {
                            self.forms.$remove(form);
                            swal("Deleted!", "Form successfully deleted!.", "success");
                        }).error(function() {
                            swal("Deleted!", "Form not deleted!. An error occured!.", "error");
                        });
                });
            }
        }

    },

    watch: {

        'forms': function() {
            this.$nextTick(function() {
                $('table').DataTable();
            });
        }

    }

});
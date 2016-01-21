Vue.component('hris-show-department', {

    ready: function() {
        this.showDepartment(DEPARTMENT_CODE);
    },

    data: function() {
        return {
            department: [],
            searchEmployee: ''
        }
    },

    methods: {
        showDepartment: function(code) {
            this.$http.get('/api/departments/' + code)
                .success(function(data) {
                    this.department = data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the employees at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });
        },
    }

});

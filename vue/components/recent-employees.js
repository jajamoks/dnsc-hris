Vue.component('hris-recent-employees', {


    ready: function() {

        this.getEmployees();

    },

    data: function() {

        return {

            employees: [],

            paginator: {},

        }

    },

    methods: {

        getEmployees: function() {
            this.$http.get('/api/employees/recent-employees/')
                .success(function(response) {
                    this.paginator = response;
                    this.employees = response.data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: '#new-employees',
                        icon: 'fa fa-warning',
                        message: 'The server cant fetch the employees, please reload the page.',
                    });
                });
        }

    },

    watch: {

        'employees': function() {
            this.$nextTick(function() {
                $('.nano').nanoScroller();
            });
        }

    },

    components: {

        'recent-employee-paginator': VuePaginator

    }

});

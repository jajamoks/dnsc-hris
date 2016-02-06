import infiniteScroll from '../mixins/infinite-scroll';

Vue.component('hris-show-department', {

    ready() {
        this.showDepartment(DEPARTMENT_CODE);
    },

    mixins: [infiniteScroll],

    data() {
        return {
            department: [],
            searchEmployee: '',
            items: []
        }
    },

    methods: {
        showDepartment(code) {
            this.$http.get('/api/departments/' + code)
                .success(function(data) {
                    this.department = data;
                    this.items = this.department.employees;
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

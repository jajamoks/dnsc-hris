window.EmployeeBirthdays = Vue.extend({

    template: require('./template.html'),

    ready: function() {

        this.getBirthdays();

    },

    data: function() {
        return {
            employees: []
        }
    },

    props: {
        showModal: {
            type: Boolean,
            default: false,
            twoWay: true
        },
    },

    methods: {
        getBirthdays: function() {
            this.$http.get('/api/employees/birthdays')
                .success(function(employees) {
                    this.employees = employees;
                }).error(function() {
                    swal('Server error', 'We cannot fetch all the birthday celebrant.', 'error');
                })
        }
    },

    components: {
        'show-birthdays-modal': VueStrap.modal
    }

})

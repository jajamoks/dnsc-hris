import htmlTemplate from './template.html';

window.EmployeeBirthdays = Vue.extend({

    template: htmlTemplate,

    ready() {

        this.getBirthdays();

    },

    data() {
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
        getBirthdays() {
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

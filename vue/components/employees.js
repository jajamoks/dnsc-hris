Vue.component('employees-list', {

    ready() {

        this.fetchAllUsers();

    },

    data() {

        return {

            user: [],

            users: [],

            employee: {

                full_name: '',

                leave_credit: {
                    special_leave: 0,
                    force_leave: 0
                },

                accumulated_leave: {
                    vacation_leave: 0,
                    sick_leave: 0,
                }

            },

            employee_qce: {
                instruction: 0,
                self: 0,
                supervisor: 0,
                peers: 0
            },

            personnel_performance: {
                core_function: 0,
                strategic_function: 0
            },

            utility: {
                can_file_vacation_leave: false,
                can_file_sick_leave: false,
                can_file_special_leave: false,
                can_file_travel_order: false
            },

            // Modal variables

            showPersonnelPerformanceModal: false,

            showEmployeeLeaveCreditsModal: false,

            showEmployeeUtilityModal: false

        }

    },

    computed: {

        personnelPerformanceRating() {
            return parseFloat(this.personnel_performance.core_function) +
                parseFloat(this.personnel_performance.strategic_function);
        },

        qceTotalPoints() {
            return parseFloat(this.employee_qce.instruction) +
                parseFloat(this.employee_qce.self) +
                parseFloat(this.employee_qce.supervisor) +
                parseFloat(this.employee_qce.peers);
        },

        // totalAccumulatedLeave: function() {
        //     return this.employee.accummulated_leave.vacation_leave + this.employee.accummulated_leave.sick_leave;
        // }

    },

    methods: {

        fetchAllUsers() {
            this.$http.get('/api/employees')
                .then(function(response) {
                    this.users = response.data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the users at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });
        },

        employeeLeaveCredits(employee) {
            if (employee) {
                this.employee = employee;
                this.showEmployeeLeaveCreditsModal = true;
            } else {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-warning',
                    message: 'This user has no Personal Data Sheet.',
                    container: 'floating',
                    timer: 3000,
                    focus: true
                });
            }
        },

        personnelPerformanceAndEmployeeQCE(user) {
            this.user = user;
            var employee = user.employee;
            if (employee) {
                this.employee = employee;
                if (employee.employee_qce) {
                    this.employee_qce = employee.employee_qce;
                } else {
                    this.employee_qce = {
                        instruction: 0,
                        self: 0,
                        supervisor: 0,
                        peers: 0
                    }
                }
                if (employee.personnel_performance) {
                    this.personnel_performance = employee.personnel_performance;
                } else {
                    this.personnel_performance = {
                        core_function: 0,
                        strategic_function: 0
                    }
                }
                this.showPersonnelPerformanceModal = true;
            } else {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-warning',
                    message: 'This user has no Personal Data Sheet.',
                    container: 'floating',
                    timer: 3000,
                    focus: true
                });
            }
        },

        saveEmployeeLeaveCredits(employee) {
            var vm = this;
            swal({
                title: "Are you sure?",
                text: "Do you really want to proceed and save this changes?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Save changes",
                closeOnConfirm: true,
            }, function() {
                vm.$http.put('/employee/' + employee.id + '/leave-credits', employee)
                    .success(function(data) {
                        $.niftyNoty({
                            type: 'dark',
                            icon: 'fa fa-info',
                            message: 'Successfully updated the employee leave and accummulated leave.',
                            container: '.leave-credit-modal-body',
                            timer: 3000,
                            focus: false
                        });
                        employee.leave_credit = data.leave_credit;
                        employee.accumulated_leave = data.accumulated_leave;
                    });
            });
        },

        savePersonnelPerformance(personnel_performance) {
            if (personnel_performance) {
                var vm = this;
                swal({
                    title: "Are you sure?",
                    text: "Do you really want to continue and save this action?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Save changes",
                    closeOnConfirm: true
                }, function() {
                    vm.$http.post('/personnel-performance/' + vm.employee.id, personnel_performance)
                        .success(function(data) {
                            $.niftyNoty({
                                type: 'dark',
                                icon: 'fa fa-info',
                                message: 'Successfully updated the employee personnel performance.',
                                container: '.personnel-performance-modal-body',
                                timer: 3000,
                                focus: false
                            });
                            vm.employee.personnel_performance = data;
                        });
                });
            } else {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-warning',
                    message: 'Cannot save.',
                    container: 'floating',
                    timer: 3000
                });
            }
        },


        saveEmployeeQCE(employee_qce) {
            if (employee_qce && this.qceTotalPoints <= 100) {
                this.$http.post('/qce/' + this.user.username, employee_qce)
                    .success(function(data) {
                        $.niftyNoty({
                            type: 'dark',
                            icon: 'fa fa-info',
                            message: 'Successfully updated the employee personnel performance.',
                            container: '.personnel-performance-modal-body',
                            timer: 3000,
                            focus: false
                        });
                        this.employee.employee_qce = data;
                    })
            }
        },

        updateUser(user) {
            this.$http.get('/user/' + user.username + '/edit')
                .success(function(markup) {
                    bootbox.dialog({
                        title: "<i class='fa fa-edit'></i> Update <strong>'" + user.username + "'</strong>",
                        message: markup
                    }).bind('mousemove', function() {
                        $('#positions').chosen({
                            width: '100%'
                        }).trigger("liszt:updated");
                    });
                });
        },

        employeeUtility(employee) {
            this.showEmployeeUtilityModal = true;
            this.employee = employee;
            this.utility = employee.utility;
        },

        saveEmployeeUtility(employee) {
            this.$http.put('/api/employees/' + employee.id + '/utility', {
                    utility: this.utility
                })
                .success(function(data) {
                    employee.utility = data;
                    swal({
                        title: 'Utility updated',
                        text: 'Employee leave utility successfully updated!',
                        type: 'success'
                    }, function() {
                        window.location.reload();
                    });
                });
        },

        employeeLeaveApprovalHeirarchy(employee) {
            console.log(JSON.stringify(employee.approval_heirarchy));
            if (employee.approval_heirarchy) {
                this.$http.get('/employee/approval-heirarchy/' + employee.id + '/edit')
                    .success(function(data) {
                        bootbox.dialog({
                            title: 'Update employee approval heirarchy',
                            message: data
                        }).bind('mousemove', function() {
                            $('.employees').chosen({
                                width: '100%'
                            });
                        });
                    })
            } else {
                this.$http.get('/employee/approval-heirarchy/' + employee.id + '/create')
                    .success(function(data) {
                        bootbox.dialog({
                            title: 'Set employee approval heirarchy',
                            message: data
                        }).bind('mousemove', function() {
                            $('.employees').chosen({
                                width: '100%'
                            });
                        });
                    })
            }
        },

        downloadPersonalDataSheet() {
            $.niftyNoty({
                type: 'success',
                container: 'page',
                icon: 'fa fa-info',
                message: 'Please wait for a moment, we are writing the Personal Data Sheet.',
                timer: 4000
            });
        }

    },

    components: {

        'personnel-performance-modal': VueStrap.modal,

        'employee-leave-credits-modal': VueStrap.modal,

        'employee-utility-modal': VueStrap.modal,

        'users-table': DataTables,

    }

});

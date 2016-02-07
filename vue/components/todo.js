Vue.component('hris-todo', {

    ready: function() {
        this.getTodos();
    },

    data: function() {
        return {
            todos: [],
            todo: {
                todo: ''
            },
            filterTodoBy: '',
            editing: false,
            filteredTodos: []
        }
    },

    methods: {

        refreshTodos: function() {
            var el = $('.refresh').niftyOverlay();
            el.niftyOverlay('hide');
            el.niftyOverlay('show')
            this.getTodos(el);
            this.initializeTodo();
        },

        getTodos: function(el = null) {
            this.$http.get('/todos')
                .success(function(todos) {
                    this.$set('todos', todos);
                }).then(function() {
                    el ? el.niftyOverlay('hide') : null
                });
        },

        storeTodo: function(todo) {
            if (todo.todo) {
                var laddaButton = Ladda.create(document.querySelector('.ladda-button'));
                laddaButton.start();
                this.$http.post('/todos', todo)
                    .success(function(data) {
                        this.todos.push(data);
                        this.initializeTodo();
                        $.niftyNoty({
                            type: 'dark',
                            icon: 'fa fa-calendar',
                            message: 'Todo added!',
                            container: 'floating',
                            timer: 5000
                        });
                    });
                laddaButton.stop();
            }
        },

        editTodo: function(todo) {
            if (!this.editing) {
                this.editing = true;
                this.todos.$remove(todo);
                this.$set('todo', todo);
                this.$$.todoInput.focus();
            } else {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-trash',
                    message: 'Save first the existing update!',
                    container: 'floating',
                    timer: 2000
                });
            }
        },

        updateTodo: function(todo) {
            if (todo.todo) {
                var laddaButton = Ladda.create(document.querySelector('.ladda-button'));
                laddaButton.start();
                this.$http.put('/todos/' + todo.id, todo)
                    .success(function(data) {
                        this.todos.push(data);
                        $.niftyNoty({
                            type: 'dark',
                            icon: 'fa fa-trash',
                            message: 'Todo updated!',
                            container: 'floating',
                            timer: 2000
                        });
                    });
                laddaButton.stop();
            } else {
                this.getTodos();
            }
            this.initializeTodo();
            this.editing = false;
        },

        destroyTodo: function(todo) {
            this.$http.delete('/todo/' + todo.id + '/delete')
                .success(function(data) {
                    this.todos.$remove(data);
                    $.niftyNoty({
                        type: 'dark',
                        icon: 'fa fa-trash',
                        message: '<strong>"' + todo.todo + '"</strong> is now deleted!',
                        container: 'floating',
                        timer: 2000
                    });
                });
        },

        destroyAllTodos: function() {
            if (this.todos.length) {
                var self = this;
                this.initializeTodo();
                swal({
                    title: "Confirm deletion",
                    text: "Are you sure to clear all todos? It will be deleted after while.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Clear",
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true
                }, function() {
                    self.$http.delete('/todos/clear')
                        .success(function() {
                            self.getTodos();
                            swal("Success", "Todos successfully cleared!", "success");
                        }).error(function() {
                            swal("Unknown error", "We are sorry! We cannot process your request", "error");
                        });
                });
            }
        },

        toggleDone: function(todo) {
            this.$http.put('/todos/' + todo.id + '/toggle-done')
                .success(function(data) {
                    this.todos.$remove(todo);
                    this.todos.push(data);
                    $.niftyNoty({
                        type: 'dark',
                        icon: 'fa fa-bullhorn',
                        message: '<strong>"' + data.todo + '"</strong> is marked ' + (data.is_done ? 'done' : 'undone') + '!',
                        container: 'floating',
                        timer: 2000
                    });
                });
        },

        initializeTodo: function() {
            this.todo = {
                todo: ''
            };
        }

    },

    watch: {

        'todos': function() {
            this.$nextTick(function() {
                $('.nano').nanoScroller();
                $('#todo-list').find('.form-checkbox').niftyCheck();
            });
        },

        'filterTodoBy': function() {
            this.$nextTick(function() {
                $('.nano').nanoScroller();
                $('#todo-list').find('.form-checkbox').niftyCheck();
            });
        }

    },

    filters: {

        filterTodo: function(todos, value) {
            var self = this;

            if (this.filterTodoBy === 'all') return todos;

            this.filteredTodos = todos.filter(function(todo) {
                return todo.is_done === self.filterTodoBy
            });
            return this.filteredTodos;
        }

    }

});

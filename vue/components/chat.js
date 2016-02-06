Vue.component('chat-component', {

    ready() {

        this.getMessageThreads();

    },

    data() {
        return {
            messageGroup: null,
            threads: [],
            messages: [],
            newMessage: {
                recipient: null,
                message: ''
            },
            searchThread: '',
            showParticipantsModal: false
        }
    },

    events: {
        threadsUpdated() {
            this.getMessageThreads();
            // this.getThread(this.messageGroup);
        },

        threadUpdated() {
            this.messageGroup = null;
            this.getThread(this.messageGroup);
        },

        newMessage(message) {
            if (message.sender_id != USER_ID) {
                if (this.messageGroup.id === message.message_group_id) {
                    message.is_sender = false;
                    document.getElementById('notif-alert').play();
                    this.messages.push(message);
                    this.$emit('threadsUpdated');
                }
            }
        }
    },

    methods: {

        updateParticipants(messageGroup) {
            this.$http.get('/message-group/' + messageGroup.id + '/edit-participants')
                .success(function(markup) {
                    bootbox.dialog({
                        title: 'Update participants',
                        message: markup
                    }).bind('mousemove', function() {
                        $('#recipients').chosen({
                            width: '100%'
                        }).trigger("liszt:updated");
                    });
                });
        },

        deleteAllMessage() {
            var that = this;

            swal({
                title: "Delete all message",
                text: "Are you sure to delete all messages?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Delete messages",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function() {
                that.$http.delete('/message-group/clear-all')
                    .success(function(data) {
                        swal("Deleted!", data, "success");
                        that.$dispatch('messagesUpdated');
                        that.$emit('threadsUpdated');
                        that.$emit('threadUpdated');
                    });
            });
        },

        loadThread(messageGroup) {
            var el = $('.refresh').niftyOverlay();
            el.niftyOverlay('hide');
            el.niftyOverlay('show');
            this.getThread(messageGroup, el);
        },

        sendNewMessage() {
            this.$http.get('/messages/create')
                .success(function(view) {
                    bootbox.dialog({
                        title: 'Send new message',
                        message: view
                    }).bind('mousemove', function() {
                        $('#recipients').chosen({
                            width: '100%'
                        }).trigger("liszt:updated");
                    });
                });
        },

        getThread(messageGroup, el = null) {
            this.$http.get('/api/messages/' + messageGroup.id)
                .success(function(data) {
                    this.messageGroup = messageGroup;
                    this.messages = data;
                }).then(function() {
                    el ? el.niftyOverlay('hide') : null
                });
        },

        getMessageThreads() {
            this.$http.get('/api/messages')
                .success(function(data) {
                    this.threads = data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the messages at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });;
        },

        sendMessage() {
            if (this.newMessage.message) {
                this.$http.post('/api/messages', {
                        'message_group_id': this.messageGroup.id,
                        'message': this.newMessage.message
                    })
                    .success(function(data) {
                        this.messages.push(data);
                        this.newMessage = {
                            message_group_id: '',
                            message: ''
                        };
                    });
            }
        },

        markAllRead() {
            this.$http.put('/api/messages')
                .success(function() {
                    $.niftyNoty({
                        type: 'dark',
                        icon: 'fa fa-eye',
                        title: 'Messages seen',
                        message: 'All messages are marked read',
                        container: 'floating',
                        timer: 3000
                    });
                    this.$dispatch('messagesUpdated');
                    this.$emit('threadUpdated');
                    // this.$emit('threadsUpdated');
                });
        },

        deleteMessageGroup(messageGroup) {
            var self = this;
            swal({
                title: "Delete conversation",
                text: "Are you sure to delete this conversation?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Delete",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function() {
                self.$http.delete('/message-group/' + messageGroup.id)
                    .success(function(data) {
                        swal("Success!", "Conversation deleted!", "success");
                        self.$emit('threadsUpdated');
                        self.$emit('threadUpdated');
                    }).error(function() {
                        swal("Unsuccessful!", "Conversation not deleted!", "error");
                    });
            });
        },

        renameThread(messageGroup) {
            var self = this;
            if (messageGroup.is_group && messageGroup.is_group_owner) {
                bootbox.prompt('Rename group', function(groupName) {
                    if (groupName.length) {
                        self.$http.put('/message-group/' + messageGroup.id + '/rename', {
                            group_name: groupName
                        }).success(function(data) {
                            self.messageGroup = data;
                            self.$emit('threadsUpdated');
                            $.niftyNoty({
                                type: 'dark',
                                icon: 'fa fa-check',
                                message: 'Group was renamed to: ' + groupName,
                                container: 'floating',
                                timer: 3000
                            });
                        });
                    }
                });
            }

        },

    },

    watch: {

        messages() {
            this.$nextTick(function() {
                // var panel = document.getElementById('chat-body');
                // var height = panel.offsetHeight;
                // var client = panel.clientHeight;
                // console.log(height + ' == ' + client);

                $('.nano').nanoScroller();
            });
        },

        searchThread() {
            this.$nextTick(function() {
                $('.nano').nanoScroller();
            });
        },

        showParticipantsModal() {
            if (this.showParticipantsModal) {
                $('#thread-participants').modal('show');
                this.showParticipantsModal = false;
            }
        }

    }

});

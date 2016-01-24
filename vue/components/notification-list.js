Vue.component('notification-list', {

    ready: function() {

        this.getNotifications();

    },

    data: function() {
        return {

            notifications: [],

            // paginator variables

            paginator: {},

            loadMore: false,
        }
    },

    events: {

        newNotification: function(notification) {
            this.notifications.push(notification);
        }

    },

    methods: {

        readNotification: function(notification) {
            this.$http.put('/api/notifications/' + notification.id + '/mark-read');
        },

        getNotifications: function() {
            this.$http.get('/api/notifications')
                .success(function(response) {
                    this.paginator = response;
                    this.notifications = response.data;
                }).error(function() {
                    $.niftyNoty({
                        type: 'danger',
                        container: 'page',
                        icon: 'fa fa-warning',
                        message: 'Sorry but we cannot fetch all the notifications at this moment. Please reload or refresh the page.',
                        timer: 4000
                    });
                });;
        },

        markAllRead: function() {
            var that = this;
            swal({
                title: "Clear notifications",
                text: "You are about to delete all your notifications. Do you want to proceed?",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Mark all as read",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function() {
                that.$http.put('/notifications')
                    .success(function(data) {
                        swal("Notifications cleared", "Notifications mark all read!", "success");
                        that.$dispatch('notificationsUpdated');
                        that.getNotifications();
                    }).error(function() {
                        swal("Unsuccessful", "Something went wrong behind the scene!", "error");
                    });
            });
        }

    },

    watch: {

        'notifications': function() {
            var self = this;
            this.$nextTick(function() {
                $('.nano').nanoScroller();

                $("#notification-list-nano").bind("scrollend", function(e) {
                    self.loadMore = true;
                });
            })
        }

    },

    components: {

        'hris-paginator': VuePaginator

    }

});

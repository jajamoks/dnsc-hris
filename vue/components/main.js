import notify from '../services/notify';

Vue.component('hris-main', {

    ready() {

        this.messageListener();

        this.notificationListener();

    },

    events: {

        threadsUpdated() {
            this.$broadcast('threadsUpdated');
        },

        messagesUpdated() {
            this.$broadcast('messagesUpdated');
        },

        notificationsUpdated() {
            this.$broadcast('notificationsUpdated');
        },

        positionsUpdated() {
            this.$broadcast('positionsUpdated');
        },

    },

    methods: {

        messageListener() {
            var self = this;

            socket.on('message', function(data) {

                self.$broadcast('newMessage', data);

            });
        },

        notificationListener() {
            var self = this;

            socket.on('notification:' + USER_ID, function(notification) {
                var notification = notification.data.notification;

                notify.show(notification);

                document.getElementById('notif-alert').play();
                self.$broadcast('newNotification', notification);

            })
        }

    }

});

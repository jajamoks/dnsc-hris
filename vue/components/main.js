Vue.component('hris-main', {

    ready: function() {

        this.messageListener();

        this.notificationListener();

    },

    events: {

        threadsUpdated: function() {
            this.$broadcast('threadsUpdated');
        },

        messagesUpdated: function() {
            this.$broadcast('messagesUpdated');
        },

        notificationsUpdated: function() {
            this.$broadcast('notificationsUpdated');
        },

        positionsUpdated: function() {
            this.$broadcast('positionsUpdated');
        },

    },

    methods: {

        messageListener: function() {
            var self = this;

            socket.on('message', function(data) {

                self.$broadcast('newMessage', JSON.parse(data));

            });
        },

        notificationListener: function() {
            var self = this;

            socket.on('notification:user:' + USER.ID, function(data) {
                var data = JSON.parse(data);
                console.log(data);
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-bullhorn',
                    message: data.message,
                    container: 'floating',
                    timer: 5000
                });
            })
        }

    }

});

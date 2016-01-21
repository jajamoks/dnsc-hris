Vue.component('hris-main', {

    ready: function() {

        // this.listenToPusher();

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

        niftyNoty: function(type, icon, message, container = 'floating', focus = true) {
            $.niftyNoty({
                type: type,
                icon: 'fa fa-' + icon,
                message: message,
                container: container,
                timer: 3000,
                focus: focus
            });
        }

    },

    methods: {

        // listenToPusher: function() {

        //     var self = this;

        //     var pusher = new Pusher('84cb96c4004fd7ebf124', {
        //         encrypted: true
        //     });

        //     var channel = pusher.subscribe('user-' + USER_ID);

        //     channel.bind('DNSCHumanResource\\Events\\NotificationCreated', function(notification) {
        //         console.log(notification);
        //         self.$emit('notificationsUpdated');
        //     });

        // }

    }

});

window.Navbar = Vue.extend({

    ready: function() {
        this.getMessages();
        this.getNotifications();
    },

    data: function() {
        return {
            auth: null,
            messages: [],
            notifications: [],
            showBirthdaysModal: false
        }
    },

    events: {
        messagesUpdated: function() {
            this.getMessages();
        },

        notificationsUpdated: function() {
            this.getNotifications();
        },

        newMessage: function(message) {
            this.getMessages();
        },

        newNotification: function(notification) {
            this.notifications.push(notification);
        }
    },

    methods: {

        getMessages: function() {
            this.$http.get('/api/messages/unread')
                .success(function(data) {
                    this.messages = data;
                });
        },

        getNotifications: function() {
            this.$http.get('/api/notifications')
                .success(function(response) {
                    this.notifications = response.data;
                });
        },

        readNotification: function(notification) {
            this.$http.put('/api/notifications/' + notification.id + '/mark-read');
        }
    },

    components: {

        'notifications': Notification,

        'hris-employees-birthday': EmployeeBirthdays

    }

});

Vue.component('hris-navbar', Navbar);

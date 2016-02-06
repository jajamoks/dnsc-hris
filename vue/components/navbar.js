window.Navbar = Vue.extend({

    ready() {
        this.getMessages();
        this.getNotifications();
    },

    data() {
        return {
            auth: null,
            messages: [],
            notifications: [],
            showBirthdaysModal: false
        }
    },

    events: {
        messagesUpdated() {
            this.getMessages();
        },

        notificationsUpdated() {
            this.getNotifications();
        },

        newMessage(message) {
            this.getMessages();
        },

        newNotification(notification) {
            this.notifications.push(notification);
        }
    },

    methods: {

        getMessages() {
            this.$http.get('/api/messages/unread')
                .success(function(data) {
                    this.messages = data;
                });
        },

        getNotifications() {
            this.$http.get('/api/notifications')
                .success(function(response) {
                    this.notifications = response.data;
                });
        },

        readNotification(notification) {
            this.$http.put('/api/notifications/' + notification.id + '/mark-read');
        }
    },

    components: {

        'notifications': Notification,

        'hris-employees-birthday': EmployeeBirthdays

    }

});

Vue.component('hris-navbar', Navbar);

var Notification = Vue.extend({

    ready: function() {

        this.getUnreadNotifications();

    },

    data: function() {

        return {

            paginate: [],

            unreadNotifications: []

        }

    },

    events: {

    },

    methods: {

        getUnreadNotifications: function() {

            this.$http.get('/api/notifications')
                .success(function(response) {
                    this.paginate = response;
                    this.unreadNotifications = response.data;
                });

        },

        loadMore: function() {
            var next_page_url = this.paginate.next_page_url;
            if (next_page_url) {
                this.$http.get(next_page_url)
                    .success(function(response) {
                        this.paginate = response;
                        for (var i = 0; i < response.data.length; i++) {
                            this.unreadNotifications.push(response.data[i]);
                        };
                    })
            }

        }

    }

});

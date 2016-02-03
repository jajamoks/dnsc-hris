Vue.component('hris-activity-logs', {

    ready: function() {
        this.getActivityLogs();
    },

    data: function() {
        return {

            logs: [],

            // Paginator component variables

            paginator: {},

            loadMore: false
        }
    },

    methods: {

        getActivityLogs: function() {
            this.$http.get('/api/system/logs')
                .then(function(res) {
                    this.paginator = res.data;
                    this.logs = res.data.data;
                });
        },

    },

    watch: {

        'logs': function() {
            var self = this;
            this.$nextTick(function() {
                $('.nano').nanoScroller();

                $("#activity-logs-nano").bind("scrollend", function(e) {
                    self.loadMore = true;
                });
            })
        }

    },

    components: {
        'hris-paginator': VuePaginator
    }

})

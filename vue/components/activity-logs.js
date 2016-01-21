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
                .success(function(res) {
                    this.paginator = res;
                    this.logs = res.data;
                });
        },

    },

    watch: {

        'logs': function() {
            this.$nextTick(function() {
                $('.nano').nanoScroller();
            })
        }

    },

    components: {
        'hris-paginator': VuePaginator
    }

})

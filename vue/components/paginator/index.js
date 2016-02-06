import htmlTemplate from './template.html';

window.VuePaginator = Vue.extend({

    template: htmlTemplate,

    props: {

        content: {
            type: Array,
            required: true,
            default: {},
            twoWay: true
        },

        loadMoreData: {
            type: Boolean,
            required: false,
            default: false,
            twoWay: true
        },

        buttonTitle: {
            type: String,
            required: false,
            default: 'Load more...'
        },

        paginator: {
            type: Object,
            default: [],
            twoWay: true
        },

    },

    methods: {

        loadMore: function() {
            var next_page_url = this.paginator.next_page_url;
            if (next_page_url) {
                var self = this;
                self.$http.get(next_page_url)
                    .success(function(response) {
                        self.paginator = response;
                        response.data.forEach(function(data) {
                            self.content.push(data);
                        });
                        self.loadMoreData = false;
                    }).error(function() {
                        $.niftyNoty({
                            type: 'danger',
                            container: 'floating',
                            icon: 'fa fa-warning',
                            message: 'The server cant fetch the requested resource, please reload the page or try again.',
                            timer: 7000
                        });
                        self.loadMoreData = false;
                    });
            }
        }

    },

    watch: {

        'loadMoreData': function() {
            if (this.loadMoreData) {
                this.loadMore();
            }
        }

    }

})

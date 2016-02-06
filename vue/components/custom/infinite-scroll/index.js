window.InfiniteScroll = Vue.extend({

    props: {

        fetchData: Function,
        twoWay: true,
        default: function() {}

    },

    ready() {

        var vm = this;

        window.addEventListener('scroll', function(event) {
            if ((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
                vm.fetchData;
            } else {
                console.log('scrolling...')
            }
        });

    },

});

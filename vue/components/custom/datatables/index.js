window.DataTables = Vue.extend({

    // template: require('./template.html'),

    props: {

        content: {
            type: Array,
            required: true,
            default: [],
            twoWay: true
        }

    },

    watch: {

        'content': function() {
            $('table').dataTable();
        }

    }

});

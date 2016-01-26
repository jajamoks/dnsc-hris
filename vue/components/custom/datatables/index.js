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
            $('table').dataTable({
                "responsive": true,
                "language": {
                    "paginate": {
                        "previous": '<i class="fa fa-angle-left"></i>',
                        "next": '<i class="fa fa-angle-right"></i>'
                    }
                }
            });
        }

    }

});

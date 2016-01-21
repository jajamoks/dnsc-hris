window.DataTables = Vue.extend({

    template: require('./template.html'),

    props: {

        tableData: Array,
        twoWay: true,
        default: []

    },

    watch: {

        tableData: function() {
            console.log(JSON.stringify(this.tableData));
            // $('table').dataTable();
        }

    }

});

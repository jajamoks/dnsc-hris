Vue.directive('datatable', {

    bind: function() {
        $('table').dataTable();
    },

    update: function(value) {
        $('table').dataTable();
    }

});

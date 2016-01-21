(function() {

    console.log('hays');

    $.fn.DataTable.ext.pager.numbers_length = 5;

    $('table').dataTable({
        "responsive": true,
        "language": {
            "paginate": {
                "previous": '<i class="fa fa-angle-left"></i>',
                "next": '<i class="fa fa-angle-right"></i>'
            }
        }
    });

})();

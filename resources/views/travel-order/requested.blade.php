@extends('layouts.app')

@section('title', 'Manage Travel Orders')

@section('breadcrumbs')
    {!! Breadcrumbs::render('approve-travel-order') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/datatables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
@stop

@section('content')
<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <div class="btn-group">
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#regular-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">Approve / Disapprove Travel Orders</h3>
    </div>
    <div id="regular-leave" class="panel-body collapse in">
        <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                	<th></th>
                	<th>Employee</th>
                    <th>Date of Filing</th>
                    <th>Destination</th>
                    <th>Purpose of Travel</th>
                    <th>Inclusive dates</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($travels as $travel)
                <tr>
                	<td><img class="img-circle img-sm" src="{{ $travel->employee->user->photo }}"/></td>
                	<td>{{ $travel->employee->full_name }}</td>
                	<td>{{ $travel->created_at->diffForHumans() }}</td>
                	<td>{{ $travel->destination }}</td>
                	<td>{{ str_limit($travel->purpose, 20) }}</td>
                	<td>{{ date('M d, Y', strtotime($travel->date_from)).' - '.date('M d, Y', strtotime($travel->date_to)) }}</td>
                	<td><label class="label label-{{ $travel->status }}">{{ $travel->status }}</label></td>
                    <td>
                        <div class="btn-group">
                            @can('approve', $travel)
                            <a href="/travel/{{ $travel->id }}/approve" class="approve btn btn-sm btn-default btn-icon btn-hover-success add-tooltip" data-original-title="Approve form request"><i class="fa fa-check"></i></a>
                            @endcan

                            <a href="/travel/{{ $travel->id }}/reject" class="reject btn btn-sm btn-default btn-icon btn-hover-danger add-tooltip" data-original-title="Reject form request"><i class="fa fa-remove"></i></a>

                            <a class="btn btn-sm btn-default btn-icon btn-hover-info add-tooltip" data-original-title="View form request"><i class="fa fa-search"></i></a>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@stop

@section('script')
<script src="/bower_components/datatables/media/js/jquery.datatables.min.js"></script>
<script src="/bower_components/datatables/media/js/datatables.bootstrap.min.js"></script>
<script src="/bower_components/datatables-responsive/js/datatables.responsive.js"></script>
<script type="text/javascript" src="/dist/js/controllers/LeaveController.js"></script>
<script>
    $.fn.DataTable.ext.pager.numbers_length = 5;

    $('.table').dataTable({
        "responsive": true,
        "language": {
            "paginate": {
                "previous": '<i class="fa fa-angle-left"></i>',
                "next": '<i class="fa fa-angle-right"></i>'
            }
        }
    });

    // function approve(travel){
    // 	bootbox.confirm({
    // 		message: 'Are you sure to approve this leave?',
    // 		size: 'small',
    // 		buttons: {
    //             confirm: {
    //                 label: '<i class="fa fa-check"></i> Approve',
    //                 className: 'btn-success'
    //             }
    //         },
    //         callback: function(result) {
    //             if (result) {
    //                 $.post('/travel/'+travel.id+'/approve', function(data){
    //                     if (data.success) {
    //                         window.location.reload();
    //                     } else {
    //                         $.niftyNoty({
    //                             type: 'dark',
    //                             icon: 'fa fa-warning',
    //                             title: 'Unsuccessful Request'  ,
    //                             message: data.message,
    //                             container : 'floating',
    //                             timer : 8000
    //                         });
    //                     }
    //                 });
    //             }
    //         }
    // 	});
    // }

    function reject(travel){
        bootbox.confirm({
            message: 'Are you sure you want to reject this leave?',
            size: 'small',
            buttons: {
                confirm: {
                    label: '<i class="fa fa-remove"></i> Reject',
                    className: 'btn-danger'
                }
            },
            callback: function(result) {
                if (result) {
                    $.post('/travel/'+travel.id+'/reject', function(data){
                        console.log(data);
                        if (data.success) {
                            window.location.reload();
                        }
                    });
                }
            }
        });
    }
</script>
@stop

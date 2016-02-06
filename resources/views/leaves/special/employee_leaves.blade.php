@extends('layouts.app')

@section('title', 'Employee Special Leaves')

@section('breadcrumbs')
    {!! Breadcrumbs::render('approve-special-leave') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
@stop

@section('content')
<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Managed leave request</h3>
    </div>
    <div class="panel-body">
        <table id="manage-leave" class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="min-w-td"></th>
                    <th>Employee ID / Username</th>
                    <th>Working Days Applied</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Leave Type</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($employee_leaves as $leave)
                <tr>
                    <td>
                        <img class="img-circle img-sm" src="{{ $leave->employee->user->photo }}"/>
                    </td>
                    <td>
                        {{ $leave->employee->first_name.' '.$leave->employee->middle_name.' '.$leave->employee->surname }}
                    </td>
                    <td>{{ $leave->number_of_days }}</td>
                    <td>{{ date('M d Y', strtotime($leave->date_from)) }}</td>
                    <td>{{ date('M d Y', strtotime($leave->date_to)) }}</td>
                    <td>{{ ucfirst($leave->type) }}</td>
                    <td>
                        <div class="btn-group">
                            <a class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-search add-tooltip" href="/leave/special/{{ $leave->id }}" data-original-title="View leave form" data-container="body"></a>

                            @can('approve', $leave)
                            <a class="approve btn btn-sm btn-default btn-icon btn-hover-success fa fa-check add-tooltip" href="/leave/special/{{ $leave->id }}/approve" data-original-title="Approve leave request" data-container="body"></a>
                            @endcan

                            <a href="/leave/special/{{ $leave->id }}/reject" class="reject btn btn-sm btn-default btn-icon btn-hover-warning fa fa-remove add-tooltip" data-original-title="Reject leave request" data-container="body"></a>
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
<script type="text/javascript" src="/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
<script type="text/javascript" src="/dist/js/controllers/LeaveController.js"></script>
<script>
    $.fn.DataTable.ext.pager.numbers_length = 5;

    $('#manage-leave').dataTable({
        "responsive": true,
        "language": {
            "paginate": {
                "previous": '<i class="fa fa-angle-left"></i>',
                "next": '<i class="fa fa-angle-right"></i>'
            }
        }
    });

    function rejectSpecialLeave(leave){
        bootbox.confirm({
            message: 'Are you sure to reject this request?',
            size: 'small',
            callback: function(result) {
                if (result) {
                    $.post('/leave/special/'+leave.id+'/reject')
                        .success(function() {
                        });
                    window.location.reload();
                }
            }
        });
    }
</script>
@stop

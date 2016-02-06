@extends('layouts.app')

@section('title', 'Employee Regular Leaves')

@section('breadcrumbs')
    {!! Breadcrumbs::render('approve-regular-leave') !!}
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
                    <th>Employee Name</th>
                    <th>Working Days Applied</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Leave Type</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($employee_leaves as $leave)
                    @can('approve', $leave)
                    <tr>
                        <td>
                            @if(is_null($leave->employee))
                            <img class="img-circle img-sm" src="/assets/img/default-avatar.png"/>
                            @else
                            <img class="img-circle img-sm" src="{{ $leave->employee->user->photo }}"/>
                            @endif
                        </td>
                        <td>
                            {{ $leave->employee->fullName() }}
                        </td>
                        <td>{{ $leave->working_days_applied }}</td>
                        <td>{{ date('M d Y', strtotime($leave->start_date)) }}</td>
                        <td>{{ date('M d Y', strtotime($leave->end_date)) }}</td>
                        <td>{{ ucfirst($leave->leave_type) }}</td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-search add-tooltip" href="/leave/regular/{{ $leave->id }}" data-original-title="View leave form" data-container="body"></a>
                                @can ('approve', $leave)
                                    <a class="approve btn btn-sm btn-default btn-icon btn-hover-success fa fa-check add-tooltip" href="/leave/regular/{{ $leave->id }}/approve" data-original-title="Approve leave request" data-container="body"></a>
                                @endcan
                                @can ('reject', $leave)
                                    <a onclick="rejectLeave({{ $leave }})" class="btn btn-sm btn-default btn-icon btn-hover-warning fa fa-remove add-tooltip" data-original-title="Reject leave request" data-container="body"></a>
                                @endcan
                            </div>
                        </td>
                    </tr>
                    @endcan
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
<!--Bootbox Modals [ OPTIONAL ]-->
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
</script>
@stop

@extends('layouts.app')

@section('title', 'Approved Employee Leaves')

@section('breadcrumbs')
    {!! Breadcrumbs::render('approved-travel-orders') !!}
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
            <a href="/travel/summary/download" class="btn"><i class="fa fa-download"></i> Download summary</a>
        </div>
        <h3 class="panel-title">Approved Travel Orders</h3>
    </div>
    <div class="panel-body">
        <table id="table" class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="min-w-td"></th>
                    <th>Employee Name</th>
                    <th>Travel Order No.</th>
                    <th>Destination</th>
                    <th>Purpose</th>
                    <th>Inclusive Dates</th>
                    <th>Expenses</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($travels as $travel)
                <tr class="">
                    <td>
                        <img class="img-circle img-sm" src="{{ $travel->employee->user->photo }}"/>
                    </td>
                    <td><a href="/employee/{{ $travel->employee->user->username }}">{{ $travel->employee->full_name }}</a></td>
                    <td>{{ $travel->travel_order_number }}</td>
                    <td>{{ $travel->destination }}</td>
                    <td>{{ str_limit($travel->purpose, 30) }}</td>
                    <td>{{ inclusive_dates($travel->date_from, $travel->date_to, 'M d, Y', 'to') }}</td>
                    <td>{{ to_currency($travel->expenses) }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/travel/{{ $travel->id }}" class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-search add-tooltip" data-original-title="View Travel Order"></a>
                            <a href="/travel/{{ $travel->id }}/download" class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-download add-tooltip" data-original-title="Download file"></a>
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
<script type="text/javascript">
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

</script>
@stop

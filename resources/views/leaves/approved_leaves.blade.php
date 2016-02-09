@extends('layouts.app')

@section('title', 'Approved Employee Leave')

@section('breadcrumbs')
    {!! Breadcrumbs::render('approved-leaves') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
@stop

@section('content')
<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <div class="btn-group">
                <a href="/leave/regular/download/summary" class="btn btn-default add-tooltip" data-original-title="{{ trans('system.download-summary') }}"><i class="fa fa-download"></i></a>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#regular-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">Regular leave</h3>
    </div>
    <div id="regular-leave" class="panel-body collapse in">
        <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th></th>
                    <th>{{ trans('system.employee-name') }}</th>
                    <th>{{ trans('system.filing-date') }}</th>
                    <th>Working days</th>
                    <th>Commutation</th>
                    <th>Inclusive Dates</th>
                    <th>{{ trans('system.leave-type') }}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($regular_leaves as $leave)
                <tr>
                    <td><img class="img-circle img-xs" src="{{ $leave->employee->user->photo }}"/></td>
                    <td><a href="/employee/{{ $leave->employee->user->username }}">{{ $leave->employee->fullName() }}</a></td>
                    <td>{{ $leave->created_at->diffForHumans() }}</td>
                    <td>{{ $leave->working_days_applied }}</td>
                    <td class="text-capitalize">{{ $leave->commutation }}</td>
                    <td>{{ date('M d Y', strtotime($leave->start_date)) . ' - ' . date('M d Y', strtotime($leave->end_date)) }}</td>
                    <td class="text-capitalize">{{ ucfirst($leave->leave_type) }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/leave/regular/{{ $leave->id }}" class="btn btn-sm btn-default btn-icon btn-hover-warning add-tooltip" data-original-title="{{ trans('system.view') }}"><i class="fa fa-search"></i></a>
                            <a href="/leave/regular/{{ $leave->id }}/download" class="btn btn-sm btn-default btn-icon btn-hover-danger add-tooltip" data-original-title="{{ trans('system.download') }}"><i class="fa fa-download"></i></a>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <div class="btn-group">
                <a href="/leave/special/summary/download" class="btn btn-default add-tooltip" data-original-title="{{ trans('system.download-summary') }}"><i class="fa fa-download"></i></a>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#special-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">Special leave</h3>
    </div>
    <div id="special-leave" class="panel-body collapse in">
        <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th></th>
                    <th>{{ trans('system.employee-name') }}</th>
                    <th>{{ trans('system.filing-date') }}</th>
                    <th>{{ trans('system.working-days-applied') }}</th>
                    <th>Inclusive Dates</th>
                    <th>{{ trans('system.leave-type') }}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($special_leaves as $leave)
                <tr>
                    <td><img class="img-circle img-xs" src="{{ $leave->employee->user->photo }}"/></td>
                    <td>{{ $leave->employee->fullName() }}</td>
                    <td>{{ $leave->created_at->diffForHumans() }}</td>
                    <td>{{ $leave->number_of_days }}</td>
                    <td>{{ date('M d Y', strtotime($leave->date_from)) . ' - ' . date('M d Y', strtotime($leave->date_to)) }}</td>
                    <td class="text-capitalize">{{ ucfirst($leave->type) }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/leave/special/{{ $leave->id }}" class="btn btn-sm btn-default btn-icon btn-hover-warning add-tooltip" data-original-title="{{ trans('system.view') }}"><i class="fa fa-search"></i></a>
                            <a href="/leave/special/{{ $leave->id }}/download" class="btn btn-sm btn-default btn-icon btn-hover-danger add-tooltip" data-original-title="{{ trans('system.download') }}"><i class="fa fa-download"></i></a>
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
<script type="text/javascript" src="/js/datatables.js"></script>
@stop

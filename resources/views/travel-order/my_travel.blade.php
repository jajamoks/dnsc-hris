@extends('layouts.app')

@section('title', 'My Travels')

@section('breadcrumbs')
    {!! Breadcrumbs::render('filed-travel-orders') !!}
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
                <a href="/travel/{{ auth()->user()->employee->id }}/download-summary" class="btn btn-default add-tooltip" data-original-title="Download summary" type="button"><i class="fa fa-download"></i></a>
                <a href="/travel/apply" class="btn btn-default add-tooltip" data-original-title="{{ trans('system.apply') }}" type="button"><i class="fa fa-plus"></i></a>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#regular-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">My Travels</h3>
    </div>
    <div id="regular-leave" class="panel-body collapse in">
        <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Date of Filing</th>
                    <th>Destination</th>
                    <th>Purpose of Travel</th>
                    <th>Inclusive dates</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($travels as $travel)
                <tr>
                	<td>{{ $travel->created_at->diffForHumans() }}</td>
                	<td>{{ $travel->destination }}</td>
                    <td>{{ str_limit($travel->purpose, 50) }}</td>
                	<td>{{ date('M d, Y', strtotime($travel->date_from)).' - '.date('M d, Y', strtotime($travel->date_to)) }}</td>
                	<td><span class="label label-table label-{{ $travel->status }}">{{ $travel->status }}</span></td>
                    <td>
                        <div class="btn-group">
                            <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle">
                                <i class="fa fa-cog"></i>
                                <span class="caret"></span>
                            </button>
                            <ul role="menu" class="dropdown-menu dropdown-menu-right">
                                <li>
                                    <a href="/travel/{{ $travel->id }}/download" class="add-tooltip" data-original-title="{{ trans('system.download') }}">
                                    <i class="fa fa-download"></i>&nbsp;{{ trans('system.download') }}
                                    </a>
                                </li>
                                <li>
                                    <a href="/travel/{{ $travel->id }}" class="add-tooltip" data-original-title="{{ trans('system.view') }}">
                                    <i class="fa fa-search"></i>&nbsp;{{ trans('system.view') }}
                                    </a>
                                </li>
                                @can('edit', $travel)
                                <li>
                                    <a href="" class="add-tooltip" data-original-title="{{ trans('system.update') }}">
                                    <i class="fa fa-edit"></i>&nbsp;{{ trans('system.update') }}
                                    </a>
                                </li>
                                @endcan
                                @can('cancel', $travel)
                                <li>
                                    <a onclick="cancelTravelOrder({{ $travel }})" class="add-tooltip unselectable" data-original-title="{{ trans('system.cancel') }}">
                                    <i class="fa fa-remove"></i>&nbsp;{{ trans('system.cancel') }}
                                    </a>
                                </li>
                                @endcan
                            </ul>
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
<script>
    function cancelTravelOrder(travel) {
        bootbox.confirm({
            size: 'small',
            message: 'Are you sure to cancel this travel order?',
            callback: function (result) {
                if (result) {
                    $.post('/travel/' + travel.id + '/cancel')
                        .success(function(data) {
                            window.location.reload();
                        }).error(function() {
                            $.niftyNoty({
                                type: 'dark',
                                icon: 'fa fa-minus',
                                message: 'Unsuccessful!',
                                container: 'floating',
                                timer: 5000
                            });
                        });
                }
            }
        })
    }
</script>
@stop

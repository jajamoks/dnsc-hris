@extends('layouts.app')

@section('title', 'My Filed Leave')

@section('breadcrumbs')
    {!! Breadcrumbs::render('filed-leaves') !!}
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
                <a href="/leave/regular/{{ auth()->user()->employee->id }}/download-summary" class="btn btn-default add-tooltip" data-original-title="Download summary" type="button"><i class="fa fa-download"></i></a>
                <a href="/leave/regular/apply" class="btn btn-default add-tooltip" data-original-title="{{ trans('system.apply') }}" type="button"><i class="fa fa-plus"></i></a>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#regular-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">Regular leave</h3>
    </div>
    <div id="regular-leave" class="panel-body collapse in">
        @include('leaves.regular.filed-personal-leaves')
    </div>
</div>

<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <div class="btn-group">
                <a href="/leave/special/{{ auth()->user()->employee->id }}/download-summary" class="btn btn-default add-tooltip" data-original-title="Download summary" type="button"><i class="fa fa-download"></i></a>
                <a href="/leave/special/apply" class="btn btn-default add-tooltip" data-original-title="{{ trans('system.apply') }}" type="button"><i class="fa fa-plus"></i></a>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#special-leave"><i class="fa fa-chevron-down"></i></button>
            </div>
        </div>
        <h3 class="panel-title">Special leave</h3>
    </div>
    <div id="special-leave" class="panel-body collapse in">
        @include('leaves.special.filed-personal-leaves')
    </div>
</div>
@stop

@section('script')
<script type="text/javascript" src="/js/datatables.js"></script>
<script type="text/javascript" src="/dist/js/controllers/LeaveController.js"></script>
@stop

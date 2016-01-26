@extends('layouts.app')

@section('title', 'Employee Dashboard')

@section('breadcrumbs')
    {!! Breadcrumbs::render('dashboard') !!}
@stop

@section('stylesheet')
<!--Full Calendar [ OPTIONAL ]-->
<link href="/bower_components/fullcalendar/dist/fullcalendar.css" rel="stylesheet">
@stop

@section('content')

    @if(auth()->user()->employee)
        <div class="row">
            @each('dashboard.partials.stat', $stats, 'stat')

            @include('leaves.partials.leave_credits')
        </div>
        <div class="row">
            <div class="col-md-4">

                @include('dashboard.partials.todo')
            </div>
            <div class="col-md-8">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-control">
                            <div class="btn-group">
                                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#my-calendar-body"><i class="fa fa-chevron-down"></i></button>
                                <button class="dropdown-toggle btn" data-toggle="dropdown"><i class="fa fa-gear"></i></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="#">School activities</a></li>
                                    <li><a href="#">Holidays</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">View all</a></li>
                                </ul>
                            </div>
                        </div>
                        <h3 class="panel-title">My Calendar</h3>
                    </div>
                    <div id="my-calendar-body" class="collapse in">
                        <div class="panel-body">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @else
        @include('dashboard.empty')
    @endif
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!--Chosen [ OPTIONAL ]-->
<script src="/bower_components/chosen/chosen.jquery.min.js"></script>

<script type="text/javascript" src="/js/calendar.js"></script>
@stop

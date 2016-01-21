@extends('layouts.app')

@section('title', 'Calendar')

@section('breadcrumbs')
    {!! Breadcrumbs::render('calendar') !!}
@stop

@section('stylesheet')
<!--Full Calendar [ OPTIONAL ]-->
<link href="/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
<!--Chosen [ OPTIONAL ]-->
<link href="/dist/plugins/chosen/chosen.min.css" rel="stylesheet">
@stop

@section('includes')
    @include('events.modal.create')
@stop

@section('content')
<div class="row">
    <div class="col-md-4 col-lg-3">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">{{ trans('system.events') }}</h3>
            </div>
            <div class="panel-body">
                <button data-toggle="modal" data-target="#newEvent" class="btn btn-block btn-mint">{{ trans('system.add-new-event') }}</button>
                <hr />
                <!-- ============================================ -->
                <h4 class="text-thin">Legend</h4>
                <div>
                    <div class="fc-event fc-list" data-class="mint">{{ trans('system.training-seminar') }}</div>
                    <div class="fc-event fc-list" data-class="danger">Philippine Holidays</div>
                </div>
                <!-- ============================================ -->
            </div>
        </div>
    </div>
    <div class="col-md-8 col-lg-9">
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-control">
                    <a href="/calendar/download" class="btn"><i class=" fa fa-download"></i>&nbsp;{{ trans('system.download-summary') }}</a>
                </div>
                <h3 class="panel-title">{{ trans('system.training-seminar') }}</h3>
            </div>
            <div class="panel-body">
                <div class="tab-base">
                    <!--Nav tabs-->
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#calendar-view"><i class="fa fa-calendar"></i> Calendar</a></li>
                        <li><a data-toggle="tab" href="#single-view"><i class="fa fa-list"></i> Single view</a></li>
                    </ul>


                    <!--Tabs Content-->
                    <div class="tab-content">
                        <div id="calendar-view" class="tab-pane fade active in">
                            <!-- Calendar placeholder-->
                            <!-- ============================================ -->
                            <div id="calendar"></div>
                            <!-- ============================================ -->
                        </div>
                        <div id="single-view" class="tab-pane fade">
                            <ul class="event-list">
                                @forelse ($events as $event)
                                <li>
                                    <time datetime="2014-07-20">
                                        <span class="day">{{ date('d', strtotime($event->start)) }}</span>
                                        <span class="month">{{ date('M', strtotime($event->start)) }}</span>
                                        <span class="year">{{ date('Y', strtotime($event->start)) }}</span>
                                        <span class="time">ALL DAY</span>
                                    </time>
                                    <div class="info">
                                        <h2 class="title">{{ $event->title }}</h2>
                                        <p class="desc">{{ $event->description }}</p>
                                    </div>
                                    <div class="social">
                                        <ul>
                                            <li class="facebook" style="width:33%;"><a href="/calendar/{{ $event->id }}"><span class="fa fa-search"></span></a></li>
                                            <li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-edit"></span></a></li>
                                            <li class="google-plus" style="width:33%;">
                                            <a onclick="deleteEvent({{ $event }})" href="javascript:void(0)"><span class="fa fa-trash"></span></a></li>
                                        </ul>
                                    </div>
                                </li>
                                @empty
                                <div class="alert-wrap in">
                                    <div class="alert alert-micro alert-border-left alert-info alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <i class="fa fa-info pr10"></i>
                                        <strong>Heads up!</strong> You have no data yet. Update to add.
                                    </div>
                                </div>
                                @endforelse
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!--Chosen [ OPTIONAL ]-->
<script src="/bower_components/chosen/chosen.jquery.min.js"></script>

<script type="text/javascript" src="/js/calendar.js"></script>
@stop

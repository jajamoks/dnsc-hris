@extends('layouts.app')

@section('title', auth()->user()->isAdmin() ? trans('breadcrumbs.admin-dashboard') : trans('breadcrumbs.president-dashboard'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('dashboard') !!}
@stop

@section('content')
    @if (auth()->user()->employee)
        <div class="row">
            @each('dashboard.partials.stat', $stats, 'stat')
        </div>
        <div class="row">
            <div class="col-md-4">
                @include('dashboard.partials.new-employees')
            </div>
            <div class="col-md-4">
                @include('dashboard.partials.todo')
            </div>
            <div class="col-md-4">
                @include('system.partial.active-user')
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                @include('system.partial.recent-activity')
            </div>
        </div>
    @else
        @include('dashboard.empty')
    @endif
@stop

@section('script')

@stop

@extends('layouts.app')

@section('title', $employee->fullName())

@section('breadcrumbs')
    {!! Breadcrumbs::render('show-personal-data', $employee) !!}
@stop

@section('content')
<div class="panel">
    <div class="panel-bg-cover">
        <img class="img-responsive" src="{{ getProfilePhotoPath($employee) }}" alt="Profile Photo">
    </div>
    <div class="panel-media">
        <img src="{{ $employee->user->photo }}" class="panel-media-img img-circle img-border-light" alt="Profile Picture">
        <div class="row">
            <div class="col-lg-7">
                <h3 class="panel-media-heading">{{ $name }}</h3>
                <a><i class="fa fa-user"></i>&nbsp;{{ $user->username }}</a>
                <p class="text-capitalize">{{ $user->positions->first()->name }} / {{ $user->department->name or 'No department' }}</p>
            </div>
            <div class="col-lg-5 text-lg-right">
                <div class="btn-group btn-group-sm">
                    <button class="btn btn-mint">
                        More about {{ $employee->first_name }}
                    </button>
                    <button class="btn btn-mint dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                        <i class="dropdown-caret fa fa-caret-down"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Personal Data Sheet</li>
                        <li><a href="/employee/{{ $user->username }}/edit"><i class="fa fa-edit"></i> {{ trans('system.update-pds') }}</a></li>
                        <li><a href="/employee/{{ $user->username }}/export"><i class="fa fa-file-excel-o"></i> {{ trans('system.download-personal-data-sheet') }}</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Others</li>
                        <li><a href="javascript:;" onclick="employeeEvents({{ $employee }})"><i class="fa fa-calendar"></i> {{ trans('system.events') }}</a></li>
                        @unless (auth()->user()->employee->id == $employee->id)
                        <li><a href="javascript:;" onclick="sendMessage({{ $employee->user }})"><i class="fa fa-envelope"></i> Send message</a></li>
                        @endunless
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        @include('leaves.partials.leave_credits')
        @include('personnel-performance.employee')
        @include('personnel-performance.employee-qce')
    </div>

    <div class="col-md-8">
        @include('employee.view_partials.view')
    </div>
</div>
@stop

@section('script')
<script type="text/javascript" src="/dist/js/message.js"></script>
<script>
function sample() {
    console.log('sample');
}

function employeeEvents(employee) {
    $.get('/employee/'+employee.user.username+'/trainings', function(data){
        bootbox.dialog({
            title: '{{ trans('system.training-seminar') }}',
            message: data,
            buttons: {
                main: {
                    label: '<i class="fa fa-remove"></i> Close',
                    className: "btn-default"
                }
            }
        });
    });
}
</script>
@stop

@extends('layouts.app')

@section('title', $employee->fullName())

@section('breadcrumbs')
    {!! Breadcrumbs::render('show-personal-data', $employee) !!}
@stop

@section('stylesheet')
<script type="text/javascript">
    var USERNAME = '{{ $employee->user->username }}';
</script>
@stop

@section('content')
<show-employee inline-template>
    <div class="row">
        @include('leaves.partials.leave_credits')
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-body bg-success text-center">
                    <img alt="{{ $employee->fullName() }}'s Avatar" class="img-lg img-circle img-border mar-btm" src="{{ $employee->user->photo }}">

                    <h4 class="mar-no">{{ $employee->fullName() }}</h4>
                    <p>{{ $employee->user->positions->isEmpty() ? 'No positions' : $employee->user->positions->first()->name }}</p>
                    <div class="pad">
                        <a class="btn btn-icon fa fa-download icon-lg add-tooltip" href="/employee/{{ $user->username }}/export" title="Download Personal Data Sheet"></a>
                        @if (auth()->user()->can('update', $employee))
                        <a class="btn btn-icon fa fa-edit icon-lg add-tooltip" href="/employee/{{ $user->username }}/edit" title="Update Personal Data Sheet"></a>
                        @endif
                        @if (auth()->user()->employee->id != $employee->id)
                        <a onclick="sendMessage({{ $employee->user }})" class="btn btn-icon fa fa-envelope icon-lg add-tooltip" href="javascript:void(0)" title="Send message"></a>
                        @endif

                        @if (auth()->user()->employee->id === $employee->id)
                        <a @click="getEmployeeEvents(username)" class="btn btn-icon fa fa-calendar icon-lg add-tooltip" href="javascript:void(0)" title="Events"></a>
                        @endif
                    </div>
                </div>

                <div class="bg-gray-light">
                    @include('employee.view_partials.view')
                </div>
            </div>
        </div>
        <div class="col-md-4">
            @include('personnel-performance.employee')
            @include('personnel-performance.employee-qce')
        </div>
    </div>

    @include('events.partials.employee-events')
</show-employee>
@stop

@section('script')
<script type="text/javascript" src="/dist/js/message.js"></script>
<script>

(function(){

    $('.fa-download').on('click', function() {
        $.niftyNoty({
            type: 'success',
            container: 'page',
            html: 'Please wait for a moment. We are writing employee informations in Personal Data Sheet. This might take a while.',
            timer: 2500
        });
    });

})();

function employeeEvents(employee) {
    $.get('/employee/'+employee.user.username+'/trainings', function(view){
        bootbox.dialog({
            title: '{{ trans('system.training-seminar') }}',
            message: view,
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

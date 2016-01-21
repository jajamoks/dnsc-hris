@extends('layouts.app')

@section('title', isset($employee) ? 'Update Personal Data Sheet' : 'Fill Up Personal Data Sheet')

@section('breadcrumbs')
    @if (isset($employee))
        {!! Breadcrumbs::render('update-personal-data', $employee) !!}
    @else
        {!! Breadcrumbs::render('create-personal-data') !!}
    @endif
@stop

@section('stylesheet')
<!--Bootstrap Validator [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
@stop

@section('content')
<!-- Alert layout example -->
<div class="panel">
    <div class="panel-alert">
        <div class="alert-wrap in">
            <div class="alert alert-success" role="alert">
                <button class="close" type="button"><i class="fa fa-times-circle"></i></button>
                <div class="media-left">
                    <span class="icon-wrap icon-wrap-md icon-circle alert-icon">
                        <i class="fa fa-info fa-lg"></i>
                    </span>
                </div>
                <div class="media-body">
                    <h4 class="alert-title">Things you might put in mind when filling up the Personal Data Sheet</h4>
                    <div class="alert-message">
                        <li>Fields with (<span class="text-danger">*</span>) are required.</li>
                        <li>You cannot proceed to the next step if required fields are empty.</li>
                        <li>Click the next or finish button to proceed to the next step.</li>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Classic Form Wizard -->
    <!--===================================================-->
    <div id="personal-data-sheet">
        <!--Nav-->
        <ul class="wz-nav-off wz-icon-inline">
            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#personal">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-user"></i></span> {{ trans('pds.personal') }}
                </a>
            </li>
            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#family">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-users"></i></span> {{ trans('pds.family')  }}
                </a>
            </li>
            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#educational">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-graduation-cap"></i></span> {{ trans('pds.education') }}
                </a>
            </li>
            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#civil-service">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-gavel"></i></span> {{ trans('pds.civil-service') }}
                </a>
            </li>
            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#work">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-briefcase"></i></span> {{ trans('pds.work-and-trainings') }}
                </a>
            </li>

            <li class="col-xs-2 bg-mint">
                <a data-toggle="tab" href="#others">
                    <span class="icon-wrap icon-wrap-xs bg-trans-dark"><i class="fa fa-asterisk"></i></span> {{ trans('pds.others') }}
                </a>
            </li>
        </ul>

        <!--Progress bar-->
        <div class="progress progress-sm progress-striped active">
            <div class="progress-bar progress-bar-mint"></div>
        </div>


        <!--Form-->
        <form id="pds-form" class="mar-top" action="{{ $action }}" method="POST" enctype="multipart/form-data">
            @if ( isset($employee))
                {!! method_field('PUT') !!}
            @endif
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <div class="panel-body">
                <div class="tab-content">

                    <!--First tab-->
                    <div id="personal" class="tab-pane">
                        @include('employee.create_partials.personal_informations')
                    </div>
                    <div id="family" class="tab-pane">
                        @include('employee.create_partials.family_backgrounds')
                    </div>
                    <div id="educational" class="tab-pane">
                        @include('employee.create_partials.educational_background')
                    </div>
                    <div id="civil-service" class="tab-pane">
                        @include('employee.create_partials.civil_service_eligibility')
                    </div>
                    <div id="work" class="tab-pane">
                        @include('employee.create_partials.work_experience')
                        @include('employee.create_partials.voluntary_work')
                        @include('employee.create_partials.training_programs')
                    </div>
                    <div id="others" class="tab-pane">
                        @include('employee.create_partials.other_information')
                    </div>
                </div>
            </div>

            <!--Footer button-->
            <div class="panel-footer text-right">
                <div class="box-inline">
                    <button type="reset" class="btn btn-warning">Clear</button>
                    <button type="button" class="previous btn btn-mint">Previous</button>
                    <button type="button" class="next btn btn-mint">Next</button>
                    <button type="submit" class="finish btn btn-mint" disabled="disabled">Finish</button>
                </div>
            </div>
        </form>
    </div>
    <!--===================================================-->
    <!-- End Classic Form Wizard -->
</div>
@stop

@section('script')
<script type="text/javascript" src="/js/pds.js"></script>
@stop

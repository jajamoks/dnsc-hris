@extends('layouts.app')

@section('title', 'Settings')

@section('stylesheet')
<!--Bootstrap Validator [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
@stop

@section('content')
<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#account-tab" data-toggle="tab"><span class="fa fa-user"></span> Account</a></li>
                <li><a href="#notification-tab" data-toggle="tab"><span class="fa fa-bell"></span> Notification</a></li>
            </ul>
        </div>
        <h3 class="panel-title">General settings</h3>
    </div>
    <div class="panel-alert">
        <div class="alert-wrap in">
            <div class="alert alert-warning" role="alert">
                <button class="close" type="button"><i class="fa fa-times-circle"></i></button>

                <div class="media-left">
                    <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                        <i class="fa fa-warning fa-lg"></i>
                    </span>
                </div>
                <div class="media-body">
                    <h4 class="alert-title">Account warning</h4>
                    <p class="alert-message">You last updated your account: <strong>{{ date('M d Y', strtotime(auth()->user()->updated_at)) }}</strong></p>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">

        <div class="tab-content">

            <div class="tab-pane fade in active" id="account-tab">
                @include('user.settings.account')
            </div>

            <div class="tab-pane fade in" id="notification-tab">
                @include('user.settings.notifications')
            </div>
        </div>
    </div>
</div>
@stop

@section('script')
<!--Bootstrap Validator [ OPTIONAL ]-->
<script src="/dist/plugins/bootstrap-validator/bootstrapValidator.min.js"></script>
@stop

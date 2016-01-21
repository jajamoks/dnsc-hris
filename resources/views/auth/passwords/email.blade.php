@extends('auth.app')

@section('title', 'Reset Password')

@section('stylesheet')
<script src='https://www.google.com/recaptcha/api.js'></script>
@stop

@section('content')
<div class="cls-content-sm panel">
    @include('flash::message')
    <div class="panel-body">
        <p class="pad-btm">Enter your email address to recover your password. </p>
        <form action="/password/email" method="POST">
            {!! csrf_field() !!}
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                    <input type="email" class="form-control" name="email" placeholder="Email" value="{{ old('email') }}">
                </div>
            </div>
            <div class="form-group g-recaptcha" data-sitekey="{{ env('RECAPTCHA_SITE_KEY') }}"></div>
            <div class="form-group text-right">
                <button data-style="expand-right" class="btn btn-mint ladda-button" type="submit">Send password reset link</button>
            </div>
        </form>
    </div>
</div>
<div class="pad-ver">
    <a href="/login" class="btn-link mar-rgt">Back to Login</a>
</div>
@stop

@extends('auth.app')

@section('title', 'Password Reset')

@section('content')
<div class="cls-content-sm panel">
    @include('flash::message')
    <div class="panel-body">
        <strong class="h4">Create new credentials</strong>
        <hr class="alt"/>
        <form action="/password/reset" method="POST">
            {!! csrf_field() !!}
            <input type="hidden" name="token" value="{{ $token }}">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                    <input type="email" class="form-control" name="email" placeholder="Email" value="{{ old('email') }}">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                    <input type="password" class="form-control" name="password" placeholder="New password">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                    <input type="password" class="form-control" name="password_confirmation" placeholder="Confirm password">
                </div>
            </div>

            <div class="form-group text-right">
                <button class="btn btn-mint" type="submit">Reset Password</button>
            </div>
        </form>
    </div>
</div>
<div class="pad-ver">
    <a href="/login" class="btn-link mar-rgt">Back to Login</a>
</div>
@stop

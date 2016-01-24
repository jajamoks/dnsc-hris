@extends('auth.app')

@section('title', 'Login your account')

@section('content')
<div class="cls-content-sm panel">
    <form method="POST">
        {!! csrf_field() !!}
        <div class="panel">
            @include('flash::message')
            <div class="panel-body">
                <strong class="h4">{{ trans('system.enter-credentials') }}</strong>
                <hr class="alt"/>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                        <input type="text" name="username" class="form-control" placeholder="Employee ID" value="{{ old('username') }}" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                    </div>
                </div>
                <div class="text-left checkbox">
                    <label class="form-checkbox form-icon">
                        <input type="checkbox" name="remember"> {{ trans('system.remember-me') }}
                    </label>
                </div>
            </div>
            <div class="panel-footer text-right">
                <button data-style="expand-right" class="ladda-button btn btn-mint" type="submit"><i class="fa fa-sign-in"></i>&nbsp;{{ trans('system.sign-in') }}</button>
            </div>
        </div>
    </form>
</div>
<div class="pad-no">
    <a href="/password/reset" class="btn-link mar-rgt">{{ trans('system.forgot-password') }} ?</a>
</div>
@stop

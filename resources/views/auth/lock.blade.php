@extends('auth.app')

@section('title', 'Incorrect Password')

@section('content')
    <div class="cls-content-sm panel widget">
        <div class="widget-header bg-danger">
            <h4 class="text-thin">{{ $user->employee ? $user->employee->full_name : $user->username }}</h4>
            {{ $user->positions->isEmpty() ? 'No assigned position' : $user->positions->first()->name }}
        </div>
        <div class="widget-body">
            <img alt="Profile Picture" class="widget-img img-circle img-border-light" src="{{ $user->photo }}">
            <p>Is this you? If yes, you are one step closer to access the most secure HRIS website in the Philippines.</p>
            <form action="/login" method="POST">
                {!! csrf_field() !!}
                <div class="form-group">
                    <input type="hidden" class="form-control" name="username" value="{{ $user->username }}">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="form-group text-right">
                    <button data-style="expand-right" class="ladda-button btn btn-block btn-danger text-uppercase" type="submit">Sign In Account</button>
                </div>
            </form>
        </div>
    </div>
    <div class="pad-ver">
        <a href="/login" class="btn-link mar-rgt">Sign in using different account</a>
    </div>
@stop

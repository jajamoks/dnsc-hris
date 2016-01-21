@extends('layouts.app')

@section('content')
<div class="cls-container bg-trans">
    <div class="cls-content">
        <h1 class="error-code text-light">508</h1>
        <p class="h4 text-light pad-btm text-thin">
            {{ trans('http-errors.508') }}
        </p>
        <div class="row mar-btm">
            <a href="javascript:history.back()">
                <button class="btn btn-default btn-lg"><i class="fa fa-arrow-left"></i> {{ trans('system.go-back') }}</button>
            </a>

            <a href="/">
                <button class="btn btn-default btn-lg"><i class="fa fa-dashboard"></i> Dashboard</button>
            </a>
        </div>
        <br>
    </div>
</div>
@stop

@extends('layouts.app')

@section('content')
	@if (auth()->user()->employee)

	@else
		@include('dashboard.empty')
	@endif
@stop

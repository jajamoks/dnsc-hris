@extends('layouts.app')

@section('content')
<form method="POST" action="/sample">
	{!! csrf_field() !!}
	<button class="btn btn-default">Submit</button>
</form>
@stop

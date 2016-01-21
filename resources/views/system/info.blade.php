@extends('layouts.app')

@section('title', 'System Information')

@section('breadcrumbs')
    {!! Breadcrumbs::render('system') !!}
@stop

@section('content')
<div class="panel">
	<div class="panel-heading">
		<div class="panel-title">
			System Information
		</div>
	</div>
	<div class="panel-body">
		<p>System title: <span class="text-bold">Davao del Norte State College Human Resource Information System</span></p>
		<p>Project started: December 2014</p>
		<p>Maintained by: Rosemale-John II C. Villacorta</p>
		<p>Built with: Laravel PHP Framework, jQuery, Vue, Twitter Bootstrap</p>
		<p>Features: </p>
		<div>
			<ul>SMS notification</ul>
			<ul>Realtime Push notification</ul>
			<ul>Realtime search with Algolia</ul>
			<ul>Email notification</ul>
			<ul>Online filing of Leave Request</ul>
			<ul>Online filing of Travel Orders</ul>
			<ul>Online document routing</ul>
			<ul>Error logging with bugsnag</ul>
			<ul>Localization (English(US) and Filipino)</ul>
			<ul>Chat app</ul>
			<ul>Todo list</ul>
			<ul>Calendar</ul>
		</div>
		<p>Project site: <a target="_blank" href="http://hris.dnscpanabo.com">http://hris.dnscpanabo.com</a></p>
		<p>Project adviser: Engr. Reir Erlinda E. Cutad</p>
		<p>Team Members: </p>
		<div>
			<ul>Rosemale-John II C. Villacorta</ul>
			<ul>Rodelyn A. Aguipo</ul>
			<ul>Rogelio A. Casono</ul>
			<ul>Ronie R. Ramos</ul>
			<ul>Renante M. Goriona</ul>
		</div>
		<p>Source code: <a href="http://github.com/rosemalejohn" target="_blank">Github</a></p>
		<p>License: MIT</p>
		<p>PHP Version: PHP 5.6</p>
		<p>Laravel Version: Laravel 5.2.10 (LTS)</p>
	</div>
</div>
@stop

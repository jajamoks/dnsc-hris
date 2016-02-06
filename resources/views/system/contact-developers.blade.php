@extends('layouts.app')

@section('title', trans('breadcrumbs.contact-developers'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('contact-developers') !!}
@stop

@section('stylesheet')
<link rel="stylesheet" type="text/css" href="/dist/plugins/summernote/summernote.min.css">
@stop

@section('content')
<div class="panel panel-default panel-left">
	<div class="panel-alert">
        <div class="alert-wrap in">
            <div class="alert alert-success" role="alert">
                <button class="close" type="button"><i class="fa fa-times-circle"></i></button>
                <div class="media-left">
                    <span class="icon-wrap icon-wrap icon-circle alert-icon">
                        <i class="fa fa-info"></i>
                    </span>
                </div>
                <div class="media-body">
                	<h4 class="alert-title">{{ trans('system.information') }}</h4>
                	{{ trans('messages.contact-developers') }}
                </div>
            </div>
        </div>
    </div>
	<div class="panel-body">

		<!--Cc & bcc toggle buttons-->
		<div class="text-right pad-btm">
			<div class="btn-group">
				<button id="toggle-cc" data-toggle="button" type="button" class="btn btn-sm btn-default btn-active-info">Cc</button>
				<button id="toggle-bcc" data-toggle="button" type="button" class="btn btn-sm btn-default btn-active-info">Bcc</button>
			</div>
		</div>

		<!--Input form-->
		<form role="form" class="form-horizontal" method="POST" action="/system/contact-developers">
			{!! csrf_field() !!}
			<div class="form-group">
				<label class="col-lg-1 control-label text-left" for="inputEmail">To</label>
				<div class="col-lg-11">
					<input type="email" name="recipient" id="inputEmail" class="form-control" value="rosemalejohn@gmail.com">
				</div>
			</div>
			<div id="cc-input" class="hide form-group">
				<label class="col-lg-1 control-label text-left" for="inputCc">Cc</label>
				<div class="col-lg-11">
					<input type="text" name="cc" class="form-control">
				</div>
			</div>
			<div id="bcc-input" class="hide form-group">
				<label class="col-lg-1 control-label text-left" for="inputBcc">Bcc</label>
				<div class="col-lg-11">
					<input type="text" name="bcc" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 control-label text-left" for="inputSubject">Subject</label>
				<div class="col-lg-11">
					<input type="text" name="subject" class="form-control" value="System vulnerabilities">
				</div>
			</div>

			<!--Attact file button-->
			<div class="media pad-btm">
				<div class="media-left">
					<span class="btn btn-default btn-file">
						Attachment <input type="file">
					</span>
				</div>
				<div id="demo-attach-file" class="media-body"></div>
			</div>

			<!--Wysiwyg editor : Summernote placeholder-->
			<textarea name="content" id="compose-mail">{{ old('content') }}</textarea>

			<hr class="alt" />

			<div class="pad-ver">
				<!--Send button-->
				<button type="submit" class="btn btn-success btn-labeled">
					<span class="btn-label"><i class="fa fa-paper-plane"></i></span> Send Mail
				</button>
			</div>
		</form>
	</div>
</div>
@stop

@section('script')
<script type="text/javascript" src="/dist/plugins/summernote/summernote.min.js"></script>
<script type="text/javascript">

	$('#compose-mail').summernote({
		height: 300,
		focus: true
	});

	$('#toggle-cc').on('click', function(){
		$('#cc-input').toggleClass('hide');
	});

	$('#toggle-bcc').on('click', function(){
		$('#bcc-input').toggleClass('hide');
	});

</script>
@stop

@extends('layouts.app')

@section('title', 'View travel order')

@section('content')
<div class="row">
	<div class="col-md-4">
		@include('partials.approval')
	</div>
	<div class="col-md-8">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-control">
					<a class="btn" href="/travel/{{ $travel->id }}/download"><i class="fa fa-download"></i> Download</a>
		        </div>
				<div class="panel-title">Travel Order</div>
			</div>
			<div class="panel-alert">
				<div class="alert-wrap in">
					<div class="alert alert-{{ $travel->status }}" role="alert">
						<button class="close" type="button"><i class="fa fa-times-circle"></i></button>
						<div class="media-left">
							<span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
								<i class="fa fa-info fa-lg"></i>
							</span>
						</div>
						<div class="media-body">
							<h4 class="alert-title">Travel Status</h4>
							<p class="alert-message">This leave request is already <strong>{{ $travel->status }}!</strong></p>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="panel-group accordion">
					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg">
							<center>
								<a>Travel Order No.:</a> <span>{!! $travel->travel_order_number or '<i class="text-danger">'.$travel->status.'</i>' !!}</span>
							</center>
						</div>
						<br>
					</div>

					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg pull-right">
								<a>Date of filing:</a> <span>{{ date('M d, Y', strtotime($travel->created_at)) }}</span>
						</div>
						<br>
					</div>

					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg">
							<span>To: </span>
						</div>

						<div class="pad-all">
							{{ $travel->recipient }}
						</div>
					</div>

					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg">
							<span>Re: Travel to: </span>
						</div>

						<div class="pad-all">
							{{ $travel->destination }}
						</div>
					</div>

					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg">
							<span>Purpose of travel: </span>
						</div>

						<div class="pad-all">
							{{ $travel->purpose }}
						</div>
					</div>

					<div class="bord-no pad-top">

						<!-- Question -->
						<div class="text-semibold pad-hor text-lg">
							<span>Estimated expenses: </span>
						</div>

						<div class="pad-all">
							{{ to_currency($travel->expenses) }}
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
@stop

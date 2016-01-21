@if ($rating)
<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">Personnel Performance Rating</h3>
	</div>
	<div>

		<!--List Group with Badges-->
		<!--===================================================-->
		<ul class="list-group">
			<li class="list-group-item">
				<span class="text-bold badge">{{ $rating->strategic_function }} %</span>Strategic Function
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $rating->core_function }} %</span>Core Function
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $rating->average() }} %</span>
				<span class=="text-danger"><strong>Total Average</strong></span>
			</li>
		</ul>
		<!--===================================================-->

	</div>
</div>
@endif

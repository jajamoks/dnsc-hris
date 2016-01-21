@if ($qce)
<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">Employee QCE</h3>
	</div>
	<div>

		<!--List Group with Badges-->
		<!--===================================================-->
		<ul class="list-group">
			<li class="list-group-item">
				<span class="text-bold badge">{{ $qce->instruction }}</span>Instruction
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $qce->self }}</span>Self
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $qce->supervisor }}</span>Supervisor
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $qce->peers }}</span>Peers
			</li>
			<li class="list-group-item">
				<span class="text-bold badge">{{ $qce->total() }}</span>
				<span class=="text-danger"><strong>Total Points</strong></span>
			</li>
		</ul>
		<!--===================================================-->

	</div>
</div>
@endif

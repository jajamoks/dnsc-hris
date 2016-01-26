<div class="col-md-3">
	<div class="panel media pad-all">
	    <div class="media-left">
	        <span class="icon-wrap icon-wrap-sm icon-circle bg-{{ $info['color'] or 'success' }}">
	        <i class="fa fa-{{ $info['icon'] }} fa-2x"></i>
	        </span>
	    </div>
	    <div class="media-body">
	        <p class="text-2x mar-no text-thin">{{ $info['count'] }}</p>
	        <p class="text-muted mar-no">{{ $info['title'] }}</p>
	    </div>
	</div>
</div>

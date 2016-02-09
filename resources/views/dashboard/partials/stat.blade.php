<div class="col-sm-6 col-md-3">
    <div class="panel panel-{{ isset($stat['class']) ? $stat['class'] : 'info' }} panel-colorful" onclick="location.href='{{ $stat['url'] }}';">
	    <div class="pad-all media">
	        <div class="media-left">
	            <span class="icon-wrap icon-wrap-xs">
	                <i class="fa fa-{{ $stat['icon'] }} fa-2x"></i>
	            </span>
	        </div>
	        <div class="media-body">
	            <p class="h3 text-thin media-heading">{!! $stat['number'] !!}</p>
	            <small class="text-uppercase">{!! $stat['title'] !!}</small>
	        </div>
	    </div>
	    <div class="progress progress-xs progress-dark-base mar-no">
	        <div style="width: %" class="progress-bar progress-bar-light" aria-valuemax="100" aria-valuemin="0" aria-valuenow="30" role="progressbar"></div>
	    </div>
	    <div class="pad-all text-right">
	        <small>{!! $stat['description'] !!}</small>
	    </div>
	</div>
</div>

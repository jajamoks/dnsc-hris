<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-certificate"></i> Civil Service Eligibility</span>
    </div>
    <div class="panel-body pb5">

        @forelse($employee->employee_civil_services()->orderBy('created_at')->get() as $civil_service)
        <h4>{{ $civil_service->career_service }}</h4>
        <h5>{{ date('M d Y', strtotime($civil_service->examination_date)) }}</h5>
        <dl>
            <dt>Rating</dt>
            <dd>{{ $civil_service->rating }}</dd>
            <dt>License No.</dt>
            <dd>{{ $civil_service->license_number }}</dd>
            <dd>Release date</dd>
            <dt>{{ $civil_service->release_date }}</dt>
        </dl>

        <hr class="short br-lighter">
        @empty
        <div class="alert-wrap in">
            <div class="alert alert-micro alert-border-left alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="fa fa-info pr10"></i>
                <strong>Heads up!</strong> You have no data yet. Update to add.
            </div>
        </div>
        @endforelse
    </div>
</div>

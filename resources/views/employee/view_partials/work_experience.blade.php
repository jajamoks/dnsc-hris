<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-briefcase"></i> Work Experience</span>
    </div>
    <div class="panel-body pb5">

        @forelse($employee->employee_work_experiences as $work_experience)
        <h4>{{ $work_experience->company }}</h4>
        <p class="text-bold">{{ $work_experience->position_title }}</p>
        <p class="text-muted"> {{ hris_date_range($work_experience->date_from, $work_experience->date_to, 'to') }}
        </p>

        <hr class="short br-lighter">
        @empty
        <div class="alert alert-micro alert-border-left alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <i class="fa fa-info pr10"></i>
            <strong>Heads up!</strong> You have no work experience yet. Update to add.
        </div>
        @endforelse

    </div>
</div>

<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-folder-open"></i> Voluntary Work</span>
    </div>
    <div class="panel-body pb5">

        @forelse($employee->employee_voluntary_works as $voluntary_work)
        <h4>{{ $voluntary_work->position }}</h4>
        <p class="text-muted"> {{ $voluntary_work->organization_name }}
            <br>{{ $voluntary_work->organization_address }}
            <br>{{ hris_date_range($voluntary_work->date_from, $voluntary_work->date_to, 'to') }}
            <br><i class="fa fa-clock-o"></i> {{ $voluntary_work->number_of_hours }} hours
        </p>

        <hr class="short br-lighter">
        @empty
        <div class="alert alert-micro alert-border-left alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <i class="fa fa-info pr10"></i>
            <strong>Heads up!</strong> You have no data yet. Update to add.
        </div>
        @endforelse

    </div>
</div>

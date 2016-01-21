
<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-folder-open"></i> Training Programs</span>
    </div>
    <div class="panel-body pb5">

        @forelse($trainings as $training_program)
        <h4><a href="/calendar/{{ $training_program->id }}">{{ $training_program->title }}</a></h4>
        <h5>{{ hris_date_range($training_program->start, $training_program->end) }}</h5>
        <p class="text-muted">Sponsored by: <strong>{{ $training_program->sponsored_by }}</strong></p>

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

<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-graduation-cap"></i> Educational Background</span>
    </div>
    <div class="panel-body pb5">

        @forelse($employee->employee_educations()->orderBy('created_at')->get() as $education)
        <h4>{{ ucfirst($education->level) }}</h4>
        <h5>{{ $education->school }}</h5>
        <h5>{{ $education->degree_course }}</h5>
        <p>{{ hris_display_string('Class of', $education->year_graduated) }}</p>

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

<div class="row">
    <div class="col-md-6">
        <h4 class="text-semibold"><i class="imoon imoon-info"></i> Event Description</h4>
        <p>{{ $training->description }}</p>
    </div>
    <div class="col-md-6">
        <h4 class="text-semibold"><i class="imoon imoon-calendar"></i> Inclusive Date</h4>

        <p>{{ $training->inclusiveDates() }}</p>
    </div>
</div>

<hr>

<h4 class="text-semibold">Training Participants</h4><br>
<table class="table table-hover">
    <tbody>
        @forelse($training->employees as $employee)
        <tr>
            <td>
                <a href="{{ getProfilePhotoPath($employee) }}">
                    <img class="img-circle img-xs" src="{{ $employee->user->photo }}"/>
                </a>
            </td>
            <td>
                <a href="/employee/{{ $employee->user->username }}">{{ $employee->fullName() }}</a>
            </td>
            @if(auth()->user()->isAdmin())
            <td class="min-w-td text-center">
                <div class="btn-group pull-right">
                    <a class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-search add-tooltip" href="/employee/{{ $employee->user->username }}" data-original-title="View user" data-container="body"></a>
                    <a onclick="removeParticipant({{ $training }}, {{ $employee }})" class="btn btn-sm btn-default btn-icon btn-hover-danger fa fa-times add-tooltip" data-original-title="Remove participant"></a>
                </div>
            </td>
            @endif
        </tr>
    </tbody>
    @empty
    <div class="alert alert-default media fade in">
        <div class="media-left">
            <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                <i class="fa fa-warning fa-lg"></i>
            </span>
        </div>
        <div class="media-body">
            <h4 class="alert-title">Ooppss!</h4>
            <p class="alert-message">There are no participants on this event.</p>
        </div>
    </div>
    @endforelse
</table>

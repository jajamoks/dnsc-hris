<div class="panel-group accordion" id="accordion">
    <div class="panel">
        <div class="panel-heading">
            <h1 class="panel-title">
            <a data-parent="#accordion" data-toggle="collapse" href="#leaveCredit">Leave Credits</a></h1>
        </div>
        <div class="panel-collapse collapse in" id="leaveCredit">
            <div class="list-group">
                @each('dashboard.partials.leave-credit', $leaveCredits, 'info')
            </div>
        </div>
    </div>

    <div class="panel">
        <div class="panel-heading">
            <h1 class="panel-title">
            <a data-parent="#accordion" data-toggle="collapse" href="#accumulatedLeave">Accumulated Leave</a></h1>
        </div>
        <div class="panel-collapse collapse" id="accumulatedLeave">
            <div class="list-group">
                @each('dashboard.partials.accumulated-leave', $accumulatedLeave, 'info')
            </div>
        </div>
    </div>
</div>

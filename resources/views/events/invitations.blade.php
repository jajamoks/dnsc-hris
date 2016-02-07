@extends('layouts.app')

@section('title', 'Trainings and Seminar')

@section('breadcrumbs')
    {!! Breadcrumbs::render('calendar') !!}
@stop

@section('stylesheet')
<script type="text/javascript">
    var USERNAME = '{{ auth()->user()->username }}';
</script>
@stop

@section('content')
<hris-event-invitations inline-template>
    <div class="row">
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <div v-if="trainingsAttended.length" class="panel-control">
                        <div class="btn-group">
                            <button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-gear"></i></button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li :class="{active: filterTrainingsAttended === ''}"><a href="#" @click="filterTrainingsAttended = ''"><i class="fa fa-list"></i>&nbsp;All</a></li>
                                <li :class="{active: filterTrainingsAttended === true}"><a href="#" @click="filterTrainingsAttended = true"><i class="fa fa-check"></i>&nbsp;Included in PDS</a></li>
                                <li :class="{active: filterTrainingsAttended === false}"><a href="#" @click="filterTrainingsAttended = false"><i class="fa fa-remove"></i>&nbsp;Not included in PDS</a></li>
                            </ul>
                        </div>
                    </div>
                    <h3 class="panel-title">Attended Trainings and Seminar</h3>
                </div>
                <div v-if="!trainingsAttended.length" class="panel-alert">
                    <div class="alert-wrap in">
                        <div class="alert alert-danger" role="alert">
                            <button class="close" type="button"><i class="fa fa-times-circle"></i></button>
                            <div class="media-left">
                                <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                                    <i class="fa fa-thumbs-o-up fa-lg"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <h4 class="alert-title">No attended trainings yet.</h4>
                                <p class="alert-message">There are no trainings listed yet. Participate in trainings and seminar more.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="trainingsAttended.length" class="panel-body">
                    <div class="timeline">
                        <div id="attending-trainings-nano" class="nano" style="height:550px">
                            <div class="nano-content pad-no">
                                <!-- Timeline header -->
                                <div class="timeline-header">
                                    <div class="timeline-header-title bg-success">Attended Trainings</div>
                                </div>

                                <div track-by="id" v-for="training in trainingsAttended | filterBy filterTrainingsAttended 'include_in_pds'" class="timeline-entry">
                                    <div class="timeline-stat">
                                        <div class="timeline-icon bg-success"><i class="fa fa-calendar fa-lg"></i>
                                        </div>
                                        <div class="timeline-time">Created @{{ training.created_at | date 'relative' }}</div>
                                    </div>
                                    <div class="timeline-label">
                                        <h4 class="mar-no">
                                            <a :href="'/calendar/' + training.id" class="text-danger">@{{ training.title }}</a>
                                            <small>@{{ training.description }}</small>
                                        </h4>
                                        <h5 class="pad-btm">@{{ training.start | date 'MMMM D, Y' }} to @{{ training.end | date 'MMMM D, Y' }}</h5>
                                        <p class="text-bold">Participants (<span class="text-info">@{{ training.employees.length }}</span>): </p>
                                        <a :href="'/employee/' + employee.user.username"
                                            v-for="employee in training.employees | limitBy 10 | orderBy 'first_name'">
                                            @{{ employee.full_name }},&nbsp;
                                        </a>
                                    </div>
                                    <div class="timeline-footer">
                                        <div class="btn-group">
                                            <button @click="toggleIncludeInPds(training)" class="btn" :class="training.include_in_pds ? 'btn-danger' : 'btn-default'"><i class="fa" :class="training.include_in_pds ? 'fa-remove' : 'fa-check'"></i>&nbsp;@{{ training.include_in_pds ? 'Exclude' : 'Include' }} in PDS</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="trainingsAttendedPaginator.next_page_url" class="panel-footer">
                    <trainings-attended-paginator :content.sync="trainingsAttended" :paginator.sync="trainingsAttendedPaginator" :load-more-data.sync="loadMoreTrainingsAttended"></trainings-attended-paginator>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <div v-if="invitations.length" class="panel-control">
                        <div class="btn-group">
                            <button @click="attendAll()" class="btn"><i class=""></i>&nbsp;Attend all</button>
                            <button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-gear"></i></button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#" @click="filterInvitations = ''"><i class="fa fa-list"></i>&nbsp;All</a></li>
                                <li><a href="#" @click="filterInvitations = true"><i class="fa fa-check"></i>&nbsp;Attending</a></li>
                                <li><a href="#" @click="filterInvitations = false"><i class="fa fa-remove"></i>&nbsp;Not attending</a></li>
                            </ul>
                        </div>
                    </div>
                    <h3 class="panel-title">Upcoming Trainings and Seminar</h3>
                </div>
                <div v-if="!invitations.length" class="panel-alert">
                    <div class="alert-wrap in">
                        <div class="alert alert-danger" role="alert">
                            <button class="close" type="button"><i class="fa fa-times-circle"></i></button>
                            <div class="media-left">
                                <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                                    <i class="fa fa-thumbs-o-up fa-lg"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <h4 class="alert-title">No upcoming trainings and seminar</h4>
                                <p class="alert-message">There are no trainings listed yet. Participate in trainings and seminar more.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="invitations.length" class="panel-body">
                    <div class="timeline">
                        <div id="invitations-nano" class="nano" style="height:550px">
                            <div class="nano-content pad-no">
                                <!-- Timeline header -->
                                <div class="timeline-header">
                                    <div class="timeline-header-title bg-success">Invitations</div>
                                </div>

                                <div track-by="id" v-for="invitation in invitations | filterBy filterInvitations 'is_going'" class="timeline-entry">
                                    <div class="timeline-stat">
                                        <div class="timeline-icon" :class="invitation.is_going ? 'bg-success' : 'bg-danger'"><i class="fa fa-calendar fa-lg"></i>
                                        </div>
                                        <div class="timeline-time">Created @{{ invitation.created_at | date 'relative' }}</div>
                                    </div>
                                    <div class="timeline-label">
                                        <h4 class="mar-no">
                                            <a :href="'/calendar/' + invitation.id" class="text-danger">@{{ invitation.title }}</a>
                                            <small>@{{ invitation.description }}</small>
                                        </h4>
                                        <h5 class="pad-btm">@{{ invitation.start | date 'MMMM D, Y' }} to @{{ invitation.end | date 'MMMM D, Y' }}</h5>
                                        <div>
                                            <p class="text-bold">Participants (<span class="text-info">@{{ invitation.employees.length }}</span>): </p>
                                            <a :href="'/employee/' + employee.user.username"
                                                v-for="employee in invitation.employees | limitBy 10 | orderBy 'first_name'">
                                                @{{ employee.full_name }},&nbsp;
                                            </a>
                                        </div>

                                        <div class="pad-top">
                                            <p class="text-bold">Attending (<span class="text-info">@{{ invitation.employees.length }}</span>): </p>
                                            <a :href="'/employee/' + employee.user.username"
                                                v-for="employee in invitation.employees | limitBy 10 | orderBy 'first_name' | filterByAttending 'going'">
                                                @{{ employee.full_name }},&nbsp;
                                            </a>
                                        </div>
                                    </div>
                                    <div class="timeline-footer">
                                        <div class="btn-group">
                                            <button v-show="!invitation.is_going" @click="rvsp(invitation, 'going')" class="btn btn-default"><i class="fa fa-check"></i>&nbsp;Attend</button>
                                            <button v-show="invitation.is_going" @click="rvsp(invitation, 'not going')" class="btn btn-danger"><i class="fa fa-remove"></i>&nbsp;Ignore</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="invitationsPaginator.next_page_url" class="panel-footer">
                    <invitations-paginator :content.sync="invitations" :paginator.sync="invitationsPaginator" :load-more-data.sync="loadMoreInvitations"></invitations-paginator>
                </div>
            </div>
        </div>
    </div>
</hris-event-invitations>
@stop

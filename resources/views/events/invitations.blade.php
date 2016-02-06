@extends('layouts.app')

@section('title', 'Trainings and Seminar Invitations')

@section('breadcrumbs')
    {!! Breadcrumbs::render('calendar') !!}
@stop

@section('stylesheet')

@stop

@section('content')
<hris-event-invitations inline-template>
    <div class="row">
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-control">

                    </div>
                    <div class="panel-title">
                        Upcoming events
                    </div>
                </div>
                <div class="panel-body">
                    <div v-for="invitation in invitations" class="alert alert-danger fade in">
                        <h4 class="alert-title">@{{ invitation.title }}</h4>
                        <p class="alert-message">@{{ invitation.description }}</p>
                        <div class="mar-top">
                            <button @click="going(invitation)" class="btn btn-default" type="button">Going</button>
                            <button @click="notGoing(invitation)" class="btn btn-danger" type="button">Not going</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-control">

                    </div>
                    <div class="panel-title">
                        RVSP
                    </div>
                </div>
                <div class="panel-body">
                    <div v-for="invitation in invitations" class="alert alert-danger fade in">
                        <h4 class="alert-title">@{{ invitation.title }}</h4>
                        <p class="alert-message">@{{ invitation.description }}</p>
                        <div class="mar-top">
                            <button @click="going(invitation)" class="btn btn-default" type="button">Going</button>
                            <button @click="notGoing(invitation)" class="btn btn-danger" type="button">Not going</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</hris-event-invitations>
@stop

@section('script')

@stop

@extends('layouts.app')

@section('title', $training->title)

@section('breadcrumbs')
    {!! Breadcrumbs::render('calendar') !!}
@stop

@section('stylesheet')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="/dist/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
<!--Chosen [ OPTIONAL ]-->
<link href="/dist/plugins/chosen/chosen.min.css" rel="stylesheet">

<script type="text/javascript">
    const TRAINING_ID = '{{ $training->id }}';
</script>
@stop

@section('content')
<hris-show-training inline-template>
    <div class="row">
        <div class="col-md-4 col-lg-3">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Details</h3>
                </div>
                <div class="panel-body">
                    <dl>
                        <dt>Inclusive dates</dt>
                        <dd>@{{ training.start + ' to ' + training.end }}</dd>
                        <dt>Sponsored by</dt>
                        <dd>@{{ training.sponsored_by }}</dd>
                        <dt>Number of hours</dt>
                        <dd>@{{ training.number_of_hours }}</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-lg-9">
            <div class="panel">
                <div class="panel-heading">
                    @if (auth()->user()->isAdmin())
                    <div class="panel-control">
                        <div class="btn-group mar-rgt">
                            <button @click="editTraining(training)" class="btn btn-default"><i class="fa fa-user-plus"></i></button>
                            <button @click="deleteTraining(training)" class="btn btn-default"><i class="fa fa-remove"></i></button>
                            <a class="btn btn-default"><i class="fa fa-download"></i></a>
                        </div>
                    </div>
                    @endif
                    <h3 class="panel-title"><i class="fa fa-users"></i>&nbsp;Participants</h3>
                </div>
                <div class="panel-body">
                    <div class="row pad-no mar-btm">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
                            <input v-model="searchEmployee" type="text" class="form-control input-lg" placeholder="Search participants in {{ $training->title }}...">
                        </div>
                    </div>
                    <div class="row">
                        <div v-if="training.employees ? !training.employees.length : false" class="cls-container bg-trans">
                            <div class="alert alert-warning">This training has no participant.</div>
                        </div>
                        <template v-else>
                            <div v-for="employee in training.employees | filterBy searchEmployee | orderBy 'surname'" class="col-md-4">
                                <div class="panel widget">
                                    <div class="widget-header bg-success"></div>
                                    <div class="widget-body text-center bg-gray-light">
                                        <img alt="Profile Picture" class="widget-img img-circle img-border" :src="employee.user.photo">
                                        <h4 class="mar-no">@{{ employee.full_name | limitBy 20 }}</h4>
                                        <p class="text-muted mar-btm text-capitalize">@{{ employee.user.position_title }}</p>

                                        <div class="pad-ver">
                                            <a class="btn btn-default btn-icon btn-hover-info fa fa-search icon-lg add-tooltip" href="/employee/@{{ employee.user.username }}" title="{{ trans('system.view') }}"></a>

                                            <a class="btn btn-default btn-icon btn-hover-primary fa fa-file icon-lg add-tooltip" href="/employee/@{{ employee.user.username }}/export" title="{{ trans('system.download-pds') }}"></a>

                                            <a class="btn btn-default btn-icon btn-hover-danger fa fa-google-plus icon-lg add-tooltip" href="#" title="Google+"></a>

                                            <a @click="sendMessage(employee.user)" class="btn btn-default btn-icon btn-hover-mint fa fa-envelope icon-lg add-tooltip" href="javascript:void(0)" title="Send Message"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('events.modal.update-training-modal')

</hris-show-training>
@stop

@section('script')
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!--Chosen [ OPTIONAL ]-->
<script src="/bower_components/chosen/chosen.jquery.min.js"></script>

@stop

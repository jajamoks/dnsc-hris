@extends('layouts.app')

@section('title', 'HR Forms')

@section('breadcrumbs')
    {!! Breadcrumbs::render('forms') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
@stop

@section('content')

@include('forms.modal.create')

<hris-forms inline-template>
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-control">
                @if (auth()->user()->isAdmin())
                <button data-toggle="modal" data-target="#newForm" class="btn"><i class="fa fa-file"></i> Add new form</button>
                @endif
            </div>
            <h3 class="panel-title">HR Forms</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th class="min-w-td"></th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Path</th>
                        <th hidden>Type</th>
                        <th>Date added</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="form in forms">
                        <td>
                            <span class="icon-wrap icon-circle" :class="form.type == 'excel' ? 'bg-success' : 'bg-primary'">
                                <i class="fa fa-md" :class="form.type == 'other' ? 'fa-file-o' : 'fa-file-' + form.type + '-o'"></i>
                            </span>
                        </td>
                        <td>@{{ form.name }}</td>
                        <td>@{{ form.description }}</td>
                        <td>@{{ form.path }}</td>
                        <td hidden>@{{ form.type }}</td>
                        <td>@{{ form.created_at | date 'MMMM DD, YYYY' }}</td>
                        <td>
                            <div class="btn-group">
                                <a href="/forms/@{{ form.id }}/download" class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-download add-tooltip" data-original-title="{{ trans('system.download') }}"></a>
                                <a target="_blank" href="/forms/@{{ form.id }}/preview" class="btn btn-sm btn-default btn-icon btn-hover-success fa fa-search add-tooltip" data-original-title="{{ trans('system.preview') }}"></a>
                                @if (auth()->user()->isAdmin())
                                    <a @click="deleteForm($index, form)" class="btn btn-sm btn-default btn-icon btn-hover-danger fa fa-remove add-tooltip" data-original-title="{{ trans('system.remove') }}"></a>
                                @endif
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <forms-table :content.sync="forms"></forms-table>
</hris-forms>
@stop

@section('script')
<script type="text/javascript" src="/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
@stop

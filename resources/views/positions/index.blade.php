@extends('layouts.app')

@section('title', trans('breadcrumbs.position-list'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('positions') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
@stop

@section('content')
<hris-positions inline-template>
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-control">
                <button @click="showAddUpdatePositionModal = true, editing = false" class="btn btn-success btn-labeled fa fa-user-plus">{{ trans('system.add-new-position') }}</button>
            </div>
            <h3 class="panel-title">{{ trans('system.positions-list') }}</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th class="min-w-td">#</th>
                        <th>{{ trans('system.position') }}</th>
                        <th>No. of employees</th>
                        <th>Date added</th>
                        <th>Date updated</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="position in positions">
                        <td>@{{ position.id }}</td>
                        <td>@{{ position.name }}</td>
                        <td>@{{ position.users.length }}</td>
                        <td><i class="fa fa-clock-o"></i>&nbsp;@{{ position.created_at | date 'MMMM DD, YYYY' }}</td>
                        <td><i class="fa fa-clock-o"></i>&nbsp;@{{ position.updated_at | date 'MMMM DD, YYYY' }}</td>
                        <td>
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle">
                                    <i class="fa fa-cog"></i>
                                    <span class="caret"></span>
                                </button>
                                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a class="unselectable" @click="showPosition(position)"><i class="fa fa-search"></i>&nbsp;Show position</a>
                                    </li>
                                    <li>
                                        <a class="unselectable" @click="editPosition(position), editing = true"><i class="fa fa-edit"></i>&nbsp;{{ trans('system.update') }}</a>
                                    </li>
                                    <li>
                                        <a class="unselectable" @click="deletePosition(position)"><i class="fa fa-remove"></i>&nbsp;{{ trans('system.remove') }}</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    @include('positions.modal.add-update-position-modal')

    @include('positions.modal.show-position-modal')

</hris-positions>
@stop

@section('script')
<script type="text/javascript" src="/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
@stop

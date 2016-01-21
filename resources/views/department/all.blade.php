@extends('layouts.app')

@section('title', trans('breadcrumbs.department-list'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('departments') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
<!--Chosen [ OPTIONAL ]-->
<link href="/dist/plugins/chosen/chosen.min.css" rel="stylesheet">
@stop

@section('includes')
    @include('department.modal.create')
@stop

@section('content')
<div class="panel">
    <div class="panel-heading">
        <div class="panel-control">
            <button data-toggle="modal" data-target="#newDepartment" class="btn btn-mint btn-labeled fa fa-plus">{{ trans('system.add-new-department') }}</button>
        </div>
        <h3 class="panel-title">Institutes</h3>
    </div>
    <div class="panel-body">
        <table id="view_all_institute" class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Institute / Department name</th>
                    <th>Employee Count</th>
                    <th>Head / Dean</th>
                    <th>Type</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($departments as $department)
                <tr>
                    <td class="text-uppercase">{{ $department->code }}</td>
                    <td>
                        <a class="btn-link add-popover" data-toggle="popover" href="/departments/{{ $department->code}}">{{ $department->name }}</a>
                    </td>
                    <td>{{ $department->users->count() }}</td>
                    <td>{{ is_null($department->head()) ? 'N/A' : $department->head()->employee->fullName() }}</td>
                    <td class="text-capitalize"><span class="label label-table label-{{ $department->type }}">{{ $department->type }}</span></td>
                    <td>
                        <div class="btn-group">
                            <button onclick="updateDepartment({{ $department }})" class="btn btn-sm btn-default btn-icon btn-hover-success add-tooltip" data-original-title="Update department"><i class="fa fa-edit"></i></button>
                            <a class="btn btn-sm btn-default btn-icon btn-hover-info fa fa-search add-tooltip" href="/departments/{{ $department->code }}" data-original-title="View Department"></a>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@stop

@section('script')
<script type="text/javascript" src="/js/datatables.js"></script>
<script type="text/javascript" src="/bower_components/chosen/chosen.jquery.min.js"></script>
<script>
function updateDepartment(department)
{
    $.get('/departments/'+department.code+'/edit', function(data){
        bootbox.dialog({
            title: department.name,
            message: data
        }).bind('mousemove', function() {
            $('#employees').chosen({width: '100%'});
        });
    });
}

function createDepartment() {
    $.get('/departments/create', function(data){
        bootbox.dialog({
            title: '{{ trans('system.add-new-department') }}',
            message: data
        });
    });
}
</script>
@stop

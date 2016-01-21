@extends('layouts.app')

@section('title', trans('system.employees'))

@section('breadcrumbs')
    {!! Breadcrumbs::render('employees') !!}
@stop

@section('stylesheet')
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/bower_components/datatables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/bower_components/datatables-responsive/css/responsive.bootstrap.scss" rel="stylesheet">
<!--Chosen [ OPTIONAL ]-->
<link href="/dist/plugins/chosen/chosen.min.css" rel="stylesheet">
@stop

@section('includes')
    @include('user.modal.create')

    @include('employee.modal.summary-filter')
@stop

@section('content')
<employees-list inline-template>

    {{-- <infinite-scroll :fetch-data="fetch"></infinite-scroll> --}}
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-control">
                <a class="btn btn-sm btn-danger btn-labeled fa fa-download" data-toggle="modal" href='#filter-report'>Download List</a>

                <button data-toggle="modal" data-target="#newUser" class="btn btn-sm btn-success btn-labeled fa fa-user-plus">{{ trans('system.add-user') }}</button>
            </div>
            <h3 class="panel-title">{{ trans('system.employee-list') }} (@{{ users.length }})</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th class="min-w-td nosort"></th>
                        <th class="hidden">Employee ID</th>
                        <th>{{ trans('system.name') }}</th>
                        <th>{{ trans('system.institute-department') }}</th>
                        <th>{{ trans('system.position') }}</th>
                        <th>Account type</th>
                        <th>Status</th>
                        <th>Member since</th>
                        <th class="nosort"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in users">
                        <td>
                            <img class="img-circle img-sm" :src="user.photo" />
                        </td>
                        <td class="hidden">@{{ user.username }}</td>
                        <td><a :href="'/employee/' + user.username"><span class="text-bold">@{{ user.display_name }}</span></a></td>
                        <td><a :href="user.department ? '/departments/' + user.department.code : null">@{{ user.department ? user.department.code : 'No department' }}</a></td>
                        <td>@{{ user.position_title }}</td>
                        <td><span class="label label-table label-@{{ user.type }}">@{{ user.type | capitalize }}</span></td>
                        <td>@{{ user.status | capitalize }}</td>
                        <td><i class="fa fa-clock-o"></i> @{{ user.created_at | date 'MMM D, YYYY' }}</td>
                        <td>
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle">
                                    <i class="fa fa-cog"></i>
                                    <span class="caret"></span>
                                </button>
                                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a class="unselectable" @click="employeeLeaveCredits(user.employee)"> Leave credits</a>
                                    </li>
                                    <li>
                                        <a class="unselectable" @click="personnelPerformanceAndEmployeeQCE(user)"> Personnel Performance</a>
                                    </li>
                                    <li>
                                        <a class="unselectable" @click="updateUser(user)"> Update user</a>
                                    </li>
                                    <template v-if="user.employee">
                                        <li class="divider"></li>
                                        <li>
                                            <a @click="employeeUtility(user.employee)" class="unselectable"> Employee Leave Utility</a>
                                        </li>
                                        <li>
                                            <a @click="employeeLeaveApprovalHeirarchy(user.employee)" class="unselectable"> Approval Heirarchy</a>
                                        </li>
                                        <li>
                                            <a @click="downloadPersonalDataSheet" href="/employee/@{{ user.username }}/export"> Download PDS</a>
                                        </li>
                                    </template>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    @include('employee.modal.leave-credits')

    @include('personnel-performance.modal.employee-personnel-performance')

    @include('employee.modal.utility')

</employees-list>
@stop

@section('script')
<script type="text/javascript" src="/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
<!--Chosen [ OPTIONAL ]-->
<script src="/bower_components/chosen/chosen.jquery.min.js"></script>

<script type="text/javascript">
    $('#modalPositions').chosen({
        width: '100%'
    }).trigger("liszt:updated");
</script>

@stop

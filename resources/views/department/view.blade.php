@extends('layouts.app')

@section('title', $department->name)

@section('breadcrumbs')
    {!! Breadcrumbs::render('view-department', $department) !!}
@stop

@section('stylesheet')
<script type="text/javascript">
    const DEPARTMENT_CODE = '{{ $department->code }}';
</script>
@stop

@section('content')
<hris-show-department inline-template>
    <div v-el="wrapper" @scroll="scrolling">
        <div class="panel">
            <div class="panel-body">
                <div class="row pad-ver mar-btm">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
                        <input v-model="searchEmployee" type="text" class="form-control input-lg" placeholder="Search employees in {{ $department->name }}...">
                    </div>
                </div>
                <div class="row">
                    <div v-if="department.employees ? !department.employees.length : false" class="cls-container bg-trans">
                        @include('department.empty')
                    </div>
                    <template v-else>
                        <div v-for="employee in items | filterBy searchEmployee | orderBy 'surname'" class="col-md-3">
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
</hris-show-department>
@stop

@section('script')
<script type="text/javascript" src="/dist/js/message.js"></script>
@stop

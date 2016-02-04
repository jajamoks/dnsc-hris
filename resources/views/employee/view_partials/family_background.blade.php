@unless(is_null($employee->employee_spouse))
<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"> {{ trans('pds.spouse-information') }}</span>
    </div>
    <div class="panel-body pn">
        <table class="table mbn tc-icon-1 tc-med-2 tc-bold-last">
            <tbody>
                <tr>
                    <td>
                        <span class="fa fa-user"></span>
                    </td>
                    <td>{{ trans('system.name') }}</td>
                    <td class="text-bold">{{ $employee->employee_spouse->first_name.' '.$employee->employee_spouse->middle_name.' '.$employee->employee_spouse->last_name }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-briefcase"></span>
                    </td>
                    <td>{{ trans('pds.occupation') }}</td>
                    <td class="text-bold">{{ $employee->employee_spouse->occupation }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-building"></span>
                    </td>
                    <td>Employer Business name</td>
                    <td class="text-bold">{{ $employee->employee_spouse->employer_business_name }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-map-marker"></span>
                    </td>
                    <td>Employer Business address</td>
                    <td class="text-bold">{{ $employee->employee_spouse->business_address }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-phone"></span>
                    </td>
                    <td>{{ trans('pds.telephone') }}</td>
                    <td class="text-bold">{{ $employee->employee_spouse->telephone_number }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
@endunless

@if(!$employee->employee_child->isEmpty())
<div class="panel">
    <div class="panel-heading">
        <div class="panel-title">{{ trans('pds.children') }}</div>
    </div>
    <div class="panel-body pn">
        <div class="table-responsive">
            <div class="bs-component">
                <table class="table mbn tc-icon-1 tc-med-2 tc-bold-last">
                    <tbody>
                        @foreach($employee->employee_child()->orderBy('birthday')->get() as $child)
                        <tr>
                            <td class="text-bold">{{ $child->name }}</td>
                            <td class="text-bold">{{ date('M d Y', strtotime($child->birthday)) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endif

@if ($employee->employee_parents)
<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"> {{ trans('pds.parents') }}</span>
    </div>
    <div class="panel-body pn">
        @unless ($employee->employee_parents->isEmpty())
        <table class="table mbn tc-icon-1 tc-med-2 tc-bold-last">
            <tbody>
                @if ($employee->employee_parents()->father() instanceof \DNSCHumanResource\Models\EmployeeParent)
                <tr>
                    <td>
                        <span class="fa fa-male"></span>
                    </td>
                    <td>{{ trans('pds.father') }}</td>
                    <td class="text-bold">{{ !is_null($employee->employee_parents()->father()) ? $employee->employee_parents()->father()->fullName() : null }}</td>
                </tr>
                @endif

                @if ($employee->employee_parents()->mother() instanceof \DNSCHumanResource\Models\EmployeeParent)
                <tr>
                    <td>
                        <span class="fa fa-female"></span>
                    </td>
                    <td>{{ trans('pds.mother') }}</td>
                    <td class="text-bold">{{ !is_null($employee->employee_parents()->mother()) ? $employee->employee_parents()->mother()->fullName() : null }}</td>
                </tr>
                @endif
            </tbody>
        </table>
        @else
        <div class="alert alert-info">No parents added!</div>
        @endunless
    </div>
</div>
@endif

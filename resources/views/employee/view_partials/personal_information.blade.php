<div class="panel">
    <div class="panel-heading">
        <span class="panel-title"> Personal Information</span>
    </div>
    <div class="panel-body">
        <table class="table table-responsive table-hover">
            <tbody>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td class="">CS ID No.</td>
                    <td><i class="text-danger">(to be filled up by CSC)</i></td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-calendar"></span>
                    </td>
                    <td>{{ trans('pds.birthday') }}</td>
                    <td class="text-bold">{{ date('M d Y', strtotime($employee->birthday)) }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-map-marker"></span>
                    </td>
                    <td>{{ trans('pds.birthplace') }}</td>
                    <td class="text-bold">{{ $employee->birthplace }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-intersex"></span>
                    </td>
                    <td>{{ trans('pds.sex') }}</td>
                    <td class="text-capitalize text-bold">{{ $employee->sex }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-balance-scale"></span>
                    </td>
                    <td>Civil Status</td>
                    <td class="text-capitalize text-bold">{{ $employee->civil_status }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-flag"></span>
                    </td>
                    <td>Citizenship</td>
                    <td class="text-capitalize text-bold">{{ $employee->citizenship }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-male"></span>
                    </td>
                    <td>{{ trans('pds.height') }}</td>
                    <td class="text-bold">{{ $employee->height }} meter</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-clock-o"></span>
                    </td>
                    <td>{{ trans('pds.weight') }}</td>
                    <td class="text-bold">{{ $employee->weight }} kilograms</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-plus-square"></span>
                    </td>
                    <td>{{ trans('pds.blood-type') }}</td>
                    <td class="text-bold">{{ $employee->blood_type }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>GSIS ID No.</td>
                    <td class="text-bold">{{ $employee->gsis_id }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>PAG-IBIG ID No.</td>
                    <td class="text-bold">{{ $employee->pagibig_id }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>PHILHEALTH ID No.</td>
                    <td class="text-bold">{{ $employee->philhealth }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>SSS ID No.</td>
                    <td class="text-bold">{{ $employee->sss_id }}</td>
                </tr>
                @if (!$employee->employee_address->isEmpty())
                <tr>
                    <td>
                        <span class="fa fa-map-marker"></span>
                    </td>
                    <td>Residential Address</td>
                    <td class="text-capitalize text-bold">{{ $employee->employee_address()->residential()->address or null }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-bolt"></span>
                    </td>
                    <td>ZIP Code</td>
                    <td class="text-bold">{{ $employee->employee_address()->residential()->zip_code or null }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-phone"></span>
                    </td>
                    <td>Telephone number</td>
                    <td class="text-bold">{{ $employee->employee_address()->residential()->telephone_number or null }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-map-marker"></span>
                    </td>
                    <td>Permanent Address</td>
                    <td class="text-capitalize text-bold">{{ $employee->employee_address()->permanent()->address or null }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-bolt"></span>
                    </td>
                    <td>ZIP Code</td>
                    <td class="text-bold">{{ $employee->employee_address()->permanent()->zip_code or null }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-phone"></span>
                    </td>
                    <td>{{ trans('pds.telephone') }}</td>
                    <td class="text-bold">{{ $employee->employee_address()->permanent()->telephone_number or null }}</td>
                </tr>
                @endif
                <tr>
                    <td>
                        <span>@</span>
                    </td>
                    <td>Email address</td>
                    <td class="text-bold">{{ $employee->user->email }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-tablet"></span>
                    </td>
                    <td>Cellphone number</td>
                    <td class="text-bold">{{ $employee->cellphone_number }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>Agency employee number</td>
                    <td class="text-bold">{{ $employee->agency_employee_number }}</td>
                </tr>
                <tr>
                    <td>
                        <span class="fa fa-credit-card"></span>
                    </td>
                    <td>TIN number</td>
                    <td class="text-bold">{{ $employee->tin }}</td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>Signature</td>
                    <td class="text-bold">
                        <img src="{{ $employee->user->signature }}">
                    </td>
                </tr>


            </tbody>
        </table>
    </div>
</div>

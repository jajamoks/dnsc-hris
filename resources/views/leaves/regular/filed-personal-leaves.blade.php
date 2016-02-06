<table class="table table-hover table-striped table-vcenter mar-top" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>{{ trans('system.filing-date') }}</th>
            <th>{{ trans('system.working-days-applied') }}</th>
            <th>Commutation</th>
            <th>Start date</th>
            <th>End date</th>
            <th>{{ trans('system.leave-type') }}</th>
            <th>Status</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach($regular_leaves as $leave)
        <tr>
            <td>{{ $leave->created_at->diffForHumans() }}</td>
            <td>{{ $leave->working_days_applied }}</td>
            <td class="text-capitalize">{{ $leave->commutation }}</td>
            <td>{{ date('M d Y', strtotime($leave->start_date)) }}</td>
            <td>{{ date('M d Y', strtotime($leave->end_date)) }}</td>
            <td class="text-capitalize">{{ ucfirst($leave->leave_type) }}</td>
            <td class="text-capitalize"><span class="label label-table label-{{ $leave->status }}">{{ $leave->status }}</span></td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-default btn-sm">{{ trans('system.choose-action') }}</button>
                    <button class="btn btn-default btn-sm dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                        <i class="dropdown-caret fa fa-caret-down"></i>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li>
                            <a href="/leave/regular/{{ $leave->id }}/download" class="add-tooltip" data-original-title="{{ trans('system.download') }}">
                            <i class="fa fa-download"></i>&nbsp;{{ trans('system.download') }}
                            </a>
                        </li>
                        <li>
                            <a href="/leave/regular/{{ $leave->id }}" class="add-tooltip" data-original-title="{{ trans('system.view') }}">
                            <i class="fa fa-search"></i>&nbsp;{{ trans('system.view') }}
                            </a>
                        </li>
                        @can('edit', $leave)
                        <li>
                            <a href="/leave/regular/{{ $leave->id }}/edit" class="add-tooltip" data-original-title="{{ trans('system.update') }}">
                            <i class="fa fa-edit"></i>&nbsp;{{ trans('system.update') }}
                            </a>
                        </li>
                        @endcan
                        @can('cancel', $leave)
                        <li>
                            <a onclick="cancelRegularLeave({{ $leave }})" class="add-tooltip unselectable" data-original-title="{{ trans('system.cancel') }}">
                            <i class="fa fa-remove"></i>&nbsp;{{ trans('system.cancel') }}
                            </a>
                        </li>
                        @endcan
                    </ul>
                </div>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>

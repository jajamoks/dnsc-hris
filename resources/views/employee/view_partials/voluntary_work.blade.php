<div class="widget-box">
    <div class="widget-header">
        <h4 class="widget-title bigger lighter">
            <i class="ace-icon fa fa-folder-open-o"></i>
            VI. Voluntary Work or Involvement in Civic/ Non-government/ People/ Voluntary Organizations
        </h4>
    </div>

    <div class="widget-body">
        <div class="widget-main no-padding">
            <table class="table table-striped table-bordered table-hover">
                <thead class='thin-border-bottom'>
                    <tr>
                        <th>Name of Organization</th>
                        <th>Address of Organization</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Number of Hours</th>
                        <th>Position/ Nature of work</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($employee->employee_voluntary_works as $voluntary_work)
                    <tr>
                        <td><span class='editable editable-click'>{!! $voluntary_work->organization_name !!}</span></td>
                        <td>{!! $voluntary_work->organization_address !!}</td>
                        <td>{!! date('M d Y', strtotime($voluntary_work->date_from)) !!}</td>
                        <td>{!! date('M d Y', strtotime($voluntary_work->date_to)) !!}</td>
                        <td>{!! $voluntary_work->number_of_hours !!}</td>
                        <td>{!! $voluntary_work->position !!}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6">
                            <div class="alert alert-block alert-success">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                <i class="ace-icon fa fa-info-circle green"></i>
                                You have no existing data. Update to add.
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
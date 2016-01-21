<div id="newDepartment" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add new department</h4>
            </div>
            <form class="form-horizontal" role="form" action="/departments" method="POST">
	            <div class="modal-body">

				    <input type="hidden" name="_token" value="{{ csrf_token() }}">

				    <div class="row">
				        <div class="col-xs-12">
				            <div class="form-group">
				                <label class="col-sm-3 control-label no-padding-right"> Code </label>

				                <div class="col-sm-4">
									<input class="form-control" type="text" name="code" placeholder="Code">
				                </div>

				            </div>

				            <div class="form-group">
				                <label class="col-sm-3 control-label no-padding-right"> Name </label>

				                <div class="col-sm-7">
				                    <input class="form-control" type="text" name="name" placeholder="Institute description / name">
				                </div>

				            </div>

				            <div class="form-group">
				                <label class="col-sm-3 control-label no-padding-right"> Type </label>

				                <div class="col-sm-7">
				                    <select class="form-control" name="type">
				                        <option value="institute">Institute</option>
				                        <option value="department">Department</option>
				                    </select>
				                </div>
				            </div>
				        </div>
				    </div>

	            </div>
	            <div class="modal-footer">
	                <button data-style="expand-right" type="submit" class="ladda-button btn btn-primary">Add department</button>
	            </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

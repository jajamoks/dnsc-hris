<div id="newForm" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Upload new form</h4>
            </div>
            <form class="form-horizontal" action="/forms" method="POST" enctype="multipart/form-data">
	            <div class="modal-body">
					{!! csrf_field() !!}
					<div class="form-group">
						<label class="col-sm-3 control-label">File</label>
						<div class="col-sm-8">
							<input type="file" class="form-control" name="file"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Name</label>
						<div class="col-sm-8">
							<input type="text" name="name" placeholder="Form title" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Description</label>
						<div class="col-sm-8">
							<input type="text" name="description" placeholder="Add a description..." class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Form Type</label>
						<div class="col-sm-8">
							<select class="form-control" name="type">
								<option value="excel">Excel</option>
								<option value="word">Word</option>
								<option value="pdf">PDF</option>
								<option value="other">Other</option>
							</select>
						</div>
					</div>
	            </div>
	            <div class="modal-footer">
	                <div class="btn-group btn-group-justified">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-primary">Upload</button>
                        </div>
                    </div>
	            </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

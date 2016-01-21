<div class="modal fade" id="new-message">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Write new message</h4>
			</div>
			<form action="/messages" method="POST">
				{!! csrf_field() !!}
				<div class="modal-body">
					<div class="form-group">
						<label class="control-label">Select recipients *</label>
				        <select class="form-control" id="recipients" data-chosen="chosen" data-placeholder="Add recipients..." name="recipient[]" multiple tabindex="4" required>
				            @foreach ($users as $user)
				            	<option value="{{ $user->id }}">{{ $user->employee ? $user->employee->fullName() : $user->username }}</option>
				            @endforeach
				        </select>
				    </div>
					<div class="form-group">
						<label class="control-label">Write message *</label>
						<textarea class="form-control" name="message" placeholder="Write anything..." required></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button data-style="expand-right" type="submit" class="ladda-button btn btn-primary">Send message</button>
				</div>
			</form>
		</div>
	</div>
</div>

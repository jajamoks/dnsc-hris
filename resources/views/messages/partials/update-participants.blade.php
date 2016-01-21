<form action="/message-group/{{ $messageGroup->id }}/edit-participants" method="POST">
	{!! method_field('PUT') !!}
	{!! csrf_field() !!}
	<select class="form-control" id="recipients" data-chosen="chosen" data-placeholder="Add recipients..." name="recipients[]" multiple tabindex="4" required>
	    @foreach (DNSCHumanResource\User::all() as $user)
	    	<option value="{{ $user->id }}" {{ $messageGroup->users->contains('username', $user->username) ? 'selected' : '' }}>{{ $user->employee ? $user->employee->fullName() : $user->username }}</option>
	    @endforeach
	</select>
	<hr class="alt">
	<div class="text-right">
		<button class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;Update</button>
	</div>
</form>

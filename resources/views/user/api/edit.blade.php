<form class="form-horizontal" action="/user/{{ $user->username }}" method="POST">
	{!! method_field('put') !!}
	{!! csrf_field() !!}
	<div class="panel-body">
		<div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> Employee ID / Username </label>
            <div class="col-sm-8">
                <input class="form-control" name="username" placeholder="Employee ID" value="{{ $user->username }}" />
                <small class="help-block text-danger text-bold">This must be changed with permission</small>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Account type</label>
			<div class="col-sm-8">
				<select class="form-control" name="type">
					<option value="user" {{ ($user->isUser() ? 'selected' : '') }}>User</option>
					<option value="admin" {{ ($user->isAdmin() ? 'selected' : '') }}>Admin</option>
					@if ($user->isPresident() || is_null($president))
					<option value="president" {{ ($user->isPresident() ? 'selected' : '') }}>President</option>
					@endif
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Status</label>
			<div class="col-sm-8">
				<select class="form-control" name="status">
					<option value="active" {{ $user->isStatus('active') ? 'selected' : null }}>Active</option>
					<option value="retired" {{ $user->isStatus('retired') ? 'selected' : null }}>Retired</option>
					<option value="resigned" {{ $user->isStatus('resigned') ? 'selected' : null }}>Resigned</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Department</label>
			<div class="col-sm-8">
				<select class="selectpicker form-control" name="department_id">
                    <optgroup label="Administration Department">
                        @foreach($departments as $department)
                        <option value="{{ $department->id }}" {{ ($department->id === $user->department_id ? 'selected' : '') }}>{{ $department->name }}</option>
                        @endforeach
                    </optgroup>
                    <optgroup label="Institute">
                        @foreach($institutes as $institute)
                        <option value="{{ $institute->id }}" {{ ($institute->id === $user->department_id ? 'selected' : '') }}>{{ $institute->name }}</option>
                        @endforeach
                    </optgroup>
                </select>
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> Position </label>
            <div class="col-sm-8">
                <select class="form-control" id="positions" data-chosen="chosen" data-placeholder="Add position..." name="positions[]" multiple tabindex="4">
                    @foreach ($positions as $position)
                    <option value="{{ $position->id }}" {{ $user->positions->contains('name', $position->name) ? 'selected' : '' }}>{{ $position->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
	</div>
	<hr>
	<div class="text-right">
		<button class="btn btn-success" type="submit"><i class="fa fa-save"></i>&nbsp;Save</button>
	</div>
</form>

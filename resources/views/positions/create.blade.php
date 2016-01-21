<form class="form-horizontal" role="form" action="{{ isset($position) ? '/positions/'.$position->id : '/positions' }}" method="POST">
    {!! isset($position) ? method_field('PUT') : null !!}
    {!! csrf_field() !!}

    <div class="row">
		<div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> Position Title</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="name" placeholder="Human Resource Administrator" value="{{ $position->name or null }}">
            </div>
        </div>
    </div>
    <hr>
    <div class="text-right">
        <button type="submit" class="btn btn-mint btn-labeled fa fa-save">{{ isset($position) ? 'Update' : 'Add position' }}</button>
    </div>
</form>

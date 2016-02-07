<form class="form-horizontal" role="form" action="/settings" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="_token" value="{{ csrf_token() }}">

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> Email </label>

        <div class="col-sm-6">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-envelope-o"></i>
                </span>
                <input class="form-control" name="email" type="text" value="{{ auth()->user()->email }}" placeholder="Email address">
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> Signature </label>

        <div class="col-sm-6">
            <input class="form-control" name="signature" type="file">
            <small class="help-block text-danger text-bold">Attach employee signature</small>
            <img src="{{ auth()->user()->signature }}"/>
        </div>

    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> Old Password </label>

        <div class="col-sm-6">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-lock"></i>
                </span>
                <input class="form-control" name="old_password" type="password" placeholder="Old password">
            </div>
        </div>

    </div>

    <hr class="alt"/>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> Password </label>

        <div class="col-sm-6">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-lock"></i>
                </span>
                <input class="form-control" type="password" name="password" placeholder="Password">
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> Retype Password </label>

        <div class="col-sm-6">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-unlock-alt"></i>
                </span>
                <input class="form-control" type="password" name="password_confirmation" placeholder="Re-type password">
            </div>
        </div>
    </div>

    <hr>
    <button type="submit" class="btn btn-default pull-right"><i class="fa fa-edit"></i>&nbsp;Save settings</button>
</form>

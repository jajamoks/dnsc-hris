<!--===================================================-->
<aside id="aside-container">
    <div id="aside">
        <div class="nano">
            <div class="nano-content">

                <!--Nav tabs-->
                <!--================================-->
                <ul class="nav nav-tabs nav-justified">
                    <li class="active">
                        <a href="#settings" data-toggle="tab">
                            <i class="fa fa-cogs"></i>
                        </a>
                    </li>
                </ul>
                <!--================================-->
                <!--End nav tabs-->

                <!-- Tabs Content -->
                <!--================================-->
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="settings">
                        <form action="/settings/notifications" method="POST">
                            <input type="hidden" name="_method" value="PUT">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <ul class="list-group bg-trans">
                                <li class="list-header">
                                    <h4 class="text-thin">Notification Settings</h4>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right">
                                        <input class="switch" name="notify_via_system" type="checkbox" {{ (auth()->user()->settings->notifiedViaSystem()) ? 'checked' : ''}}>
                                    </div>
                                    <p>Receive notification</p>
                                    <small class="text-muted">You will be notified via our system.</small>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right">
                                        <input class="switch" name="notify_via_email" type="checkbox" {{ (auth()->user()->settings->notifiedViaEmail()) ? 'checked' : ''}}>
                                    </div>
                                    <p>Notifications via email</p>
                                    <small class="text-muted">We will sent notifications through email.</small>
                                </li>
                                <li class="list-group-item">
                                    <div class="pull-right">
                                        <input class="switch" name="notify_via_sms" type="checkbox" {{ (auth()->user()->settings->notifiedViaSMS()) ? 'checked' : ''}}>
                                    </div>
                                    <p>Notification via sms</p>
                                    <small class="text-muted">We will send your notification directly to your mobile phone. Just provide your mobile number.</small>
                                </li>

                                <li class="list-group-item">
                                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Save settings</button>
                                </li>
                            </ul>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</aside>
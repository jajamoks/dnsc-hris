<div class="cls-container bg-trans">
    <div class="cls-content">
        <h1 class="text-light"><i class="fa fa-clipboard fa-5x"></i></h1>
        <p class="h4 text-muted pad-btm text-thin">{{ trans('messages.empty_dashboard') }}</p>
        <div class="row mar-btm">
            <a href="/employee/create">
                <button class="btn btn-default btn-lg"><i class="fa fa-pencil"></i> {{ trans('system.fill-up') }}</button>
            </a>

            <a href="/logout">
                <button class="btn btn-default btn-lg"><i class="fa fa-sign-out"></i> {{ trans('system.logout') }}</button>
            </a>
        </div>
        <br>
    </div>
</div>

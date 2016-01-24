<li id="notification" class="dropdown">
    <a href="javascript:void(0)" data-toggle="dropdown" class="dropdown-toggle">
        <i class="fa fa-bell fa-lg"></i>
        <span v-if="notifications.length" class="notification badge badge-header badge-danger">@{{ notifications.length }}</span>
    </a>

    <!--Notification dropdown menu-->
    <div class="dropdown-menu dropdown-menu-md with-arrow animated flipInX">
        <div class="pad-all bord-btm">
            <p class="text-lg text-muted text-thin mar-no">You have @{{ notifications.length | pluralize 'notification' }}</p>
        </div>
        <div class="nano scrollable">
            <div class="nano-content">
                <ul class="head-list">
                    <li @click="readNotification(notification)" v-if="notifications.length" v-for="notification in notifications | orderBy 'created_at' -1">
                        <a href="@{{ notification.url }}" class="media">
                            <div class="media-left">
                                <span class="icon-wrap bg-@{{ notification.color }}">
                                    <i class="fa fa-@{{ notification.icon }} fa-lg"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <div class="text" v-text="notification.message"></div>
                                <small class="text-muted">@{{ notification.created_at | date 'relative' }}</small>
                            </div>
                        </a>
                    </li>
                    <li v-if="!notifications.length">
                        <a class="media unselectable">
                            <div class="media-left">
                                <span class="icon-wrap bg-success">
                                    <i class="fa fa-trash-o"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <h5 class="text-muted">{{ trans('messages.no-notifications') }}</h5>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!--Dropdown footer-->
        <div class="pad-all bord-top">
            <a href="/notifications" class="btn-link text-dark box-block">
                <i class="fa fa-angle-right fa-lg pull-right"></i>{{ trans('system.show-all-notifications') }}
            </a>
        </div>
    </div>
</li>

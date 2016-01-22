<li class="dropdown">
    <a href="javascript:void" data-toggle="dropdown" class="dropdown-toggle">
        <i class="fa fa-envelope fa-lg"></i>
        <span v-if="messages.length" class="badge badge-header badge-danger">@{{ messages.length }}</span>
    </a>

    <!--Message dropdown menu-->
    <div class="dropdown-menu dropdown-menu-md with-arrow animated flipInX">
        <div class="pad-all bord-btm">
            <p class="text-lg text-muted text-thin mar-no">You have @{{ messages.length | pluralize 'unread message' }}</p>
        </div>
        <div class="nano scrollable">
            <div class="nano-content">
                <ul class="head-list">
                    <!-- Dropdown list-->
                    <li v-for="message in messages">
                        <a href="/messages" class="media">
                            <div class="media-left">
                                <img :src="message.sender.photo" alt="Profile Picture" class="img-circle img-sm">
                            </div>
                            <div class="media-body">
                                <div>@{{ message.message | limitBy 40 }}</div>
                                <small class="text-muted">@{{ message.created_at | date 'relative' }}</small>
                            </div>
                        </a>
                    </li>
                    <li v-if="!messages.length">
                        <a class="media unselectable">
                            <div class="media-left">
                                <span class="icon-wrap bg-success">
                                    <i class="fa fa-comments"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <h5 class="text-muted">{{ trans('messages.no-messages') }}</h5>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!--Dropdown footer-->
        <div class="pad-all bord-top">
            <a href="/messages" class="btn-link text-dark box-block">
                <i class="fa fa-angle-right fa-lg pull-right"></i>{{ trans('system.view-all-messages') }}
            </a>
        </div>
    </div>
</li>

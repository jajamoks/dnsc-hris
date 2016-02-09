<hris-activity-logs inline-template>
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-control">
                <span class="label label-success">@{{ logs.length + ' activities' }}</span>
                <button class="btn btn-default" type="button">
                    <i class="fa fa-trash"></i>&nbsp;
                </button>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#recent-activities"><i class="fa fa-chevron-down"></i></button>
            </div>
            <div class="panel-title">{{ trans('system.recent-activities') }}</div>
        </div>
        <div v-if="!logs.length" class="panel-alert">
            <div class="alert-wrap in">
                <div class="alert alert-danger" role="alert">
                    <button class="close" type="button"><i class="fa fa-times-circle"></i></button>
                    <div class="media-left">
                        <span class="icon-wrap icon-wrap-xs icon-circle alert-icon">
                            <i class="fa fa-trash fa-lg"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <h4 class="alert-title">No activity logs</h4>
                        <p class="alert-message">There are no activity on your system yet.</p>
                    </div>
                </div>
            </div>
        </div>
        <div v-else id="recent-activities" class="collapse in">
            <div class="table-responsive">
                <div id="activity-logs-nano" class="nano" style="height:400px">
                    <div class="nano-content pad-no">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr v-for="notification in logs">
                                    <td></td>
                                    <td><i class="fa fa-@{{ notification.icon }}"></i></td>
                                    <td>
                                        <a href="@{{ notification.url }}">
                                            <strong>@{{ notification.sent_by_user.display_name }}</strong> to <strong>@{{ notification.sent_to_user.display_name }}</strong>
                                            "@{{ notification.message }}"
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer" v-if="paginator.next_page_url">
            <hris-paginator :content.sync="logs" :paginator.sync="paginator" :load-more-data.sync="loadMore"></hris-paginator>
        </div>
    </div>
</hris-activity-logs>

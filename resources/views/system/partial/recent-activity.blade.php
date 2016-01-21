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
        <div id="recent-activities" class="collapse in">
            <div class="table-responsive">
                <div class="nano" style="height:400px">
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

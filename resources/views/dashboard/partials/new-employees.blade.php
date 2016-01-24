<hris-recent-employees inline-template>
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-control">
                <span class="label label-danger">@{{ employees.length | pluralize 'employee' }}</span>
                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#new-employees"><i class="fa fa-chevron-down"></i></button>
            </div>
            <div class="panel-title">{{ trans('system.new-employees') }}</div>
        </div>
        <div class="list-group">
            <div id="new-employees" class="collapse in">
                <div id="new-employees-nano" class="nano" style="height:350px">
                    <div class="nano-content pad-no">
                        <a v-for="employee in employees" class="list-group-item list-item-md" href="/employee/@{{ employee.user.username }}">
                            <div class="media-left">
                                <img class="img-sm img-circle" :src="employee.user.photo" />
                            </div>
                            <div class="media-right">
                                <h5 class="list-group-item-heading text-semibold">@{{ employee.full_name }}</h5>
                                <p class="list-group-item-text">
                                    Joined @{{ employee.created_at | date 'relative' }} / Updated @{{ employee.updated_at | date 'relative' }}
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div v-if="paginator.next_page_url" class="panel-footer">
            <recent-employee-paginator :content.sync="employees" :paginator.sync="paginator" :load-more-data.sync="loadMore"></recent-employee-paginator>
        </div>
    </div>
</hris-recent-employees>

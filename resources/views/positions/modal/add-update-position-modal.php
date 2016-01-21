<add-update-position-modal :show.sync="showAddUpdatePositionModal" :title="editing ? position.name : 'Add new position'" :effect="'zoom'" >
    <div slot="modal-body">
        <div class="modal-body">
            <div class="alert-wrap in">
                <div class="alert alert-micro alert-success">
                    Press <code><strong>ENTER</strong></code> to save changes and persist it into the database.
                </div>
            </div>
            <br/>
            <form class="form-horizontal" role="form" method="POST" @submit.prevent="editing ? updatePosition(position) : savePosition(position)">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right"> Position Title</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" v-model="position.name" placeholder="Human Resource Administrator">
                    </div>
                </div>
                <button type="submit" class="hidden"></button>
            </form>
        </div>
    </div>
    <div slot="modal-footer">
        <div class="modal-footer">
            <button @click="showAddUpdatePositionModal = false" class="btn btn-default"><i class="fa fa-remove"></i>&nbsp;Close</button>
        </div>
    </div>
</add-update-position-modal>

<show-position-modal :show.sync="showPositionModal" :title="position.name" :effect="'zoom'" >
    <div slot="modal-body">
        <div class="modal-body">
            <template v-if="position">
                <div v-if="position.users ? position.users.length : false" class="nano" style="height:350px">
                    <div class="nano" style="height:350px">
                        <div class="nano-content pad-no">
                            <div class="list-group">
                                <a v-for="user in position.users" class="list-group-item list-item" :href="'/employee/' + user.username">
                                    <div class="media-left">
                                        <img class="img-sm img-circle" :src="user.photo" />
                                    </div>
                                    <div class="media-right">
                                        <h5 class="list-group-item-heading text-semibold">{{ user.display_name }}</h5>
                                        <p class="list-group-item-text">
                                            Joined {{ user.created_at | date 'MMMM DD, YYYY' }}
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-else class="alert alert-success">No employees in this position.</div>
            </template>
        </div>
    </div>
    <div slot="modal-footer">
        <div class="modal-footer">
            <button @click="showPositionModal = false" class="btn btn-default"><i class="fa fa-remove"></i>&nbsp;Close</button>
        </div>
    </div>
</show-position-modal>

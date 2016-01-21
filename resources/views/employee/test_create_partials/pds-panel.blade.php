<div class="panel panel-bordered">
    <!--Panel heading-->
    <div class="panel-heading">
        <div class="panel-control">
            <button class="add-field btn btn-default add-tooltip" data-append="#{{ $panel_body_id }}" data-target="#{{ $clone_element }}" data-toggle="tooltip" data-original-title="Add {{ $title }}"><i class="fa fa-plus"></i></button>
            <button class="btn btn-default" data-target="#{{ $panel_body_id }}" data-toggle="collapse"><i class="fa fa-chevron-down"></i></button>
        </div>
        <h3 class="panel-title">{{ $title }}</h3>
    </div>

    <!--Panel body-->
    <div id="{{ $panel_body_id }}" class="collapse in">
        <div class="panel-body">
            @yield($as . '_panel_content')
        </div>
    </div>
</div>

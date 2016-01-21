var elixir = require('laravel-elixir');

elixir.config.sourcemaps = false;

elixir.config.assetsDir = 'public';

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function(mix) {

    /*

    mix.styles([
        'plugins/css/jquery/jquery-ui.min.css',
        'plugins/css/bootstrap/bootstrap.min.css',
        'plugins/css/fontawesome/font-awesome.min.css',
        'plugins/css/animate/animate.min.css',
        'plugins/css/mcustomscrollbar/jquery.mCustomScrollbar.css',
        'bower_components/sweetalert/dist/sweetalert.css',
    ], 'public/css/plugins.css', 'public');

    mix.less([
        'style.less',
        'theme.less'
    ], 'public/css/app.css', 'public');

    mix.scripts([
            'plugins/js/jquery/jquery.min.js',
            'plugins/js/jquery/jquery-ui.min.js',
            'plugins/js/bootstrap/bootstrap.min.js',
            'plugins/js/moment.min.js',
            'plugins/js/mcustomscrollbar/jquery.mCustomScrollbar.min.js',
            'bower_components/sweetalert/dist/sweetalert.min.js',
        ], 'public/js/main.js', 'public')
        .browserify([
            'app.js'
        ], 'public/js/app.js', 'vue');

    */
    mix.styles([
            // 'dist/css/font.css',
            'bower_components/bootstrap/dist/css/bootstrap.css',
            'bower_components/font-awesome/css/font-awesome.css',
            'bower_components/animate.css/animate.css',
            'bower_components/sweetalert/dist/sweetalert.css',
            'bower_components/sweetalert/themes/facebook/facebook.css',
            'dist/css/style-v2.css',
            'dist/css/theme.css',
            'bower_components/ladda/dist/ladda-themeless.min.css'
        ], 'public/css/all.min.css', 'public')
        .copy([
            'public/bower_components/font-awesome/fonts',
            'public/bower_components/bootstrap/fonts'
        ], 'public/fonts')
        .scripts([
            'bower_components/jquery/dist/jquery.js',
            'bower_components/bootstrap/dist/js/bootstrap.js',
            'bower_components/moment/min/moment.min.js'
        ], 'public/js/main.min.js', 'public')
        .scripts([
            'dist/js/app.js',
            'bower_components/nanoscroller/bin/javascripts/jquery.nanoscroller.js',
            'bower_components/metisMenu/dist/metisMenu.js',
            'bower_components/fastclick/lib/fastclick.js',
            'bower_components/bootbox.js/bootbox.js',
            'bower_components/sweetalert/dist/sweetalert.min.js',
            'dist/js/hris.js'
        ], 'public/js/all.min.js', 'public')
        .scripts([
            'dist/js/notifications.js'
        ], 'public/js/notifications.js', 'public')
        .scripts([
            'dist/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js',
            'dist/plugins/bootstrap-validator/bootstrapValidator.min.js',
            'dist/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js',
            'bower_components/jquery.maskedinput/dist/jquery.maskedinput.min.js',
            'dist/plugins/fileuploads/fileupload.min.js',
            'dist/plugins/fileuploads/holder.min.js',
            'dist/js/pds.js'
        ], 'public/js/pds.js', 'public')
        .scripts([
            'bower_components/fullcalendar/dist/fullcalendar.min.js',
            'bower_components/fullcalendar/dist/gcal.js',
            'dist/js/calendar.js'
        ], 'public/js/calendar.js', 'public')
        .scripts([
            'bower_components/datatables/media/js/jquery.datatables.min.js',
            'bower_components/datatables/media/js/datatables.bootstrap.min.js',
            'bower_components/datatables-responsive/js/datatables.responsive.js',
            'dist/js/datatables.js'
        ], 'public/js/datatables.js', 'public')
        .browserify([
            'app.js'
        ], 'public/js/app.min.js', 'vue');
});

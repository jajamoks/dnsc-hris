var elixir = require('laravel-elixir');

elixir.config.sourcemaps = false;

elixir.config.assetsDir = 'public';

elixir(function(mix) {
    mix.styles([
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

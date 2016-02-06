<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="description" content="{{ config('hris.meta.description') }}">
        <meta name="keywords" content="{{ config('hris.meta.keywords') }}">
        <meta name="author" content="{{ config('hris.meta.author') }}">

        <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
        <link rel="manifest" href="/favicon/manifest.json">

        <title>@yield('title', 'DNSC Human Resource Information System') </title>

        <!--Open Sans Font [ OPTIONAL ] -->

        <!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet"> -->

        <!-- <link href="/css/all.min.css" rel="stylesheet"> -->

        <link rel="stylesheet" type="text/css" href="/bower_components/bootstrap/dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="/bower_components/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="/bower_components/animate.css/animate.css">
        <link rel="stylesheet" type="text/css" href="/bower_components/sweetalert/dist/sweetalert.css">
        <link rel="stylesheet" type="text/css" href="/bower_components/sweetalert/themes/facebook/facebook.css">
        <link rel="stylesheet" type="text/css" href="/dist/css/style-v2.css">
        <link rel="stylesheet" type="text/css" href="/dist/css/theme.css">
        <link rel="stylesheet" type="text/css" href="/bower_components/ladda/dist/ladda-themeless.min.css">

        <style type="text/css">
            .background-image {
                background-image: url("/img/background.jpg");
            }
        </style>

        @yield('stylesheet')

        <script src="/bower_components/PACE/pace.min.js"></script>
    </head>

    <body class="nifty-ready">

        <div id="container" class="cls-container">

            <div id="bg-overlay" class="bg-img background-image"></div>

            <!-- HEADER -->
            <!--===================================================-->
            <div class="cls-header cls-header-lg">
                <div class="cls-brand">
                    <a class="box-inline" href="/login">
                        <span class="brand-title">DNSC <span class="text-thin">Human Resource Information System</span></span>
                    </a>
                </div>
            </div>
            <!--===================================================-->

            <!--===================================================-->
            <div class="cls-content">
                @yield('content')
            </div>
            <!--===================================================-->

        </div>
        <!--===================================================-->
        <!-- END OF CONTAINER -->

        <!--JAVASCRIPT-->
        <!--=================================================-->

        <script src="/js/main.min.js"></script>

        <script type="text/javascript" src="/js/app.min.js"></script>

        <script type="text/javascript" src="/js/all.min.js"></script>

        <script>
            // (function(i, s, o, g, r, a, m) {
            //     i['GoogleAnalyticsObject'] = r;
            //     i[r] = i[r] || function() {
            //         (i[r].q = i[r].q || []).push(arguments)
            //     }, i[r].l = 1 * new Date();
            //     a = s.createElement(o),
            //         m = s.getElementsByTagName(o)[0];
            //     a.async = 1;
            //     a.src = g;
            //     m.parentNode.insertBefore(a, m)
            // })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            // ga('create', 'UA-71607545-1', 'auto');
            // ga('send', 'pageview');
        </script>

    </body>

</html>

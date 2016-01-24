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

        <title>@yield('title', config('hris.site-title'))</title>

        <link rel="stylesheet" type="text/css" href="/css/all.min.css">

        @yield('stylesheet')

        <link rel="stylesheet" type="text/css" href="/bower_components/PACE/themes/green/pace-theme-minimal.css">

        <script type="text/javascript" src="/bower_components/PACE/pace.min.js"></script>

        <script type="text/javascript">

            const USER_ID = '{{ auth()->user()->id }}';

        </script>

    </head>

    <body id="hris" class="nifty-ready" v-cloak>

        @yield('includes')

        <hris-main inline-template>
            <div id="container" class="effect mainnav-lg navbar-fixed">

                @include('layouts.navbar')

                <div class="boxed">
                    <div id="content-container">
                        @yield('header')

                        @include('flash::message')

                        @yield('message')
                        <div id="page-title">
                            <h1 class="page-header text-overflow">@yield('title')</h1>
                        </div>
                        @yield('breadcrumbs')
                        <div id="page-content" class="">
                            @yield('content')
                        </div>
                    </div>

                    <nav id="mainnav-container" class="affix">
                        <div id="mainnav">
                            <div id="mainnav-shortcut">
                                <ul class="list-unstyled">
                                    <li class="col-xs-4" data-content="{{ trans('system.messages') }}">
                                        <a class="shortcut-grid" href="/messages">
                                            <i class="fa fa-envelope"></i>
                                        </a>
                                    </li>
                                    <li class="col-xs-4" data-content="{{ trans('system.notifications') }}">
                                        <a class="shortcut-grid" href="/notifications">
                                            <i class="fa fa-bullhorn"></i>
                                        </a>
                                    </li>
                                    <li class="col-xs-4" data-content="Profile">
                                        <a class="shortcut-grid" href="/employee/{{ auth()->user()->username }}">
                                            <i class="fa fa-user"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            @include('layouts.sidebar')
                        </div>
                    </nav>

                </div>

                @include('layouts.footer')

                <button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
            </div>

            <audio id="notif-alert" src="/audio/alert.mp3" preload="auto"></audio>
        </hris-main>

        <script type="text/javascript" src="/js/main.min.js"></script>

        <script type="text/javascript" src="/bower_components/vue-strap/dist/vue-strap.min.js"></script>

        <script type="text/javascript" src="/js/app.min.js"></script>

        @yield('script')

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

<hris-navbar inline-template>
    <header id="navbar">
        <div id="navbar-container" class="boxed">

            <!--Brand logo & name-->
            <!--================================-->
            <div class="navbar-header">
                <a href="/dashboard" class="navbar-brand">
                    <img src="/imagecache/small/dnsc.png" alt="Davao del Norte State College Logo" class="brand-icon img-sm img-circle">
                    <div class="brand-title">
                        <span class="brand-text"> DNSC HRIS</span>
                    </div>
                </a>
            </div>
            <!--================================-->
            <!--End brand logo & name-->

            <!--Navbar Dropdown-->
            <!--================================-->
            <div class="navbar-content clearfix">
                <ul class="nav navbar-top-links pull-left">

                    <!--Navigation toogle button-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="tgl-menu-btn">
                        <a class="mainnav-toggle" href="javascript:void(0)">
                            <i class="fa fa-navicon fa-lg"></i>
                        </a>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End Navigation toogle button-->

                    @include('layouts.navbar-partials.messages')

                    <!--Notification dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    @include('layouts.navbar-partials.notifications')

                    @include('layouts.navbar-partials.mega-dropdown')
                </ul>
                <ul class="nav navbar-top-links pull-right">
                    <li class="dropdown">
                        <a class="lang-selector dropdown-toggle" href="javascript:void" data-toggle="dropdown">
                            <span class="lang-selected">
                                <img class="lang-flag" src="/img/flags/{{ config('app.locale') == 'en' ? 'united-states.png' : 'philippines.png' }}" alt="{{ config('app.locale') == 'en' ? trans('system.english') : trans('system.filipino') }}">
                                <span class="lang-name">{{ trans('system.change-language') }}</span>
                            </span>
                        </a>

                        <!--Language selector menu-->
                        <ul class="head-list dropdown-menu with-arrow animated flipInX">
                            <li>
                                <!--English-->
                                <a href="/lang/en" class="{{ config('app.locale') == 'en' ? 'active' : null }}">
                                    <img class="lang-flag" src="/img/flags/united-states.png" alt="{{ trans('system.english') }}">
                                    <span class="lang-name">{{ trans('system.english') }}</span>
                                </a>
                            </li>
                            <li>
                                <!--Philippines-->
                                <a href="/lang/fil" class="{{ config('app.locale') == 'fil' ? 'active' : null }}">
                                    <img class="lang-flag" src="/img/flags/philippines.png" alt="{{ trans('system.filipino') }}">
                                    <span class="lang-name">{{ trans('system.filipino') }}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--User dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li id="dropdown-user" class="dropdown">
                        <a href="javascript:void" data-toggle="dropdown" class="dropdown-toggle text-right">
                            <span class="pull-right">
                               <img class='img-circle img-user' src="{{ auth()->user()->photo }}"/>
                            </span>
                            <div class="username">{{ (!is_null(auth()->user()->employee)) ? auth()->user()->employee->first_name : auth()->user()->username }}</div>
                        </a>

                        <div class="dropdown-menu dropdown-menu-md dropdown-menu-right with-arrow panel-default animated flipInX">
                            <div class="pad-top pad-rgt pad-lft bord-btm">
                                <a href="/employee/{{ auth()->user()->username }}">
                                    <p class="text-lg text-muted text-semibold mar-btm">
                                        {{ auth()->user()->display_name }}
                                    </p>
                                </a>
                            </div>
                            <!-- User dropdown menu -->
                            <ul class="head-list">
                                <li>
                                    <a href="/messages">
                                        <span v-if="messages.length" class="badge badge-danger pull-right">@{{ messages.length }}</span>
                                        <i class="fa fa-envelope fa-fw fa-lg"></i> {{ trans('system.messages') }}
                                    </a>
                                </li>
                                <li>
                                    <a href="/settings">
                                        <i class="fa fa-gear fa-fw fa-lg"></i> {{ trans('system.settings') }}
                                    </a>
                                </li>
                                <li>
                                    <a target="_blank" href="/system/contact-developers">
                                        <i class="fa fa-question-circle fa-fw fa-lg"></i> {{ trans('system.contact-us') }}
                                    </a>
                                </li>
                                <li>
                                    <a href="/logout">
                                        <i class="fa fa-sign-out fa-fw fa-lg"></i> {{ trans('system.logout') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End user dropdown-->
                </ul>
            </div>
            <!--================================-->
            <!--End Navbar Dropdown-->

        </div>
    </header>
</hris-navbar>

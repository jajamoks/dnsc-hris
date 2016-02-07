<hris-sidebar inline-template>
    <div id="mainnav-menu-wrap">
        <div class="nano scrollable has-scrollbar">
            <div class="nano-content">
                <ul id="mainnav-menu" class="list-group">
                    <li class="list-header">{{ trans('system.main-navigation') }}</li>
                    <!--Menu list item-->
                    <li class="">
                        <a href="/dashboard">
                            <i class="fa fa-dashboard"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.dashboard') }}</strong>
                            </span>
                        </a>
                    </li>

                    <!--Menu list item-->
                    <li>
                        <a class="unselectable">
                            <i class="fa fa-user"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.personal-data') }}</strong>
                            </span>
                            <i class="arrow"></i>
                        </a>

                        <!--Submenu-->
                        <ul class="collapse">
                            @if(empty($user->employee))
                            <li><a href="/employee/create">{{ trans('system.fill-up-pds') }}</a></li>
                            @else
                            <li><a href="/employee/{{ auth()->user()->username }}">{{ trans('system.personal-data-sheet') }}</a></li>
                            <li><a href="/employee/{{ auth()->user()->username }}/edit"><strong>{{ trans('system.update-personal-data') }}</strong></a></li>
                            @endif
                        </ul>
                    </li>

                    @if($user->employee)
                    <li>
                        <a class="unselectable">
                            <i class="fa fa-list"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.leave-management') }}</strong>
                            </span>
                            @if (($regularLeaveCount + $specialLeaveCount) > 0)
                            <span class="label label-danger pull-right">
                                {{ $regularLeaveCount + $specialLeaveCount }}
                            </span>
                            @else
                            <i class="arrow"></i>
                            @endif
                        </a>

                        <!--Submenu-->
                        <ul class="collapse">
                            @if ($user->isAdmin())
                            <li>
                                <a href="/leave">
                                    {{ trans('system.approved-leaves') }}
                                </a>
                            </li>
                            @endif
                            <li><a href="/leave/personal">{{ trans('system.my-filed-leaves') }}</a></li>
                            <li>
                                <a class="unselectable">
                                    {{ trans('system.regular-leave') }}
                                    @if ($regularLeaveCount > 0)
                                    <span class="label label-danger pull-right">{{ $regularLeaveCount }}</span>
                                    @else
                                    <i class="arrow"></i>
                                    @endif
                                </a>

                                <!--Submenu-->
                                <ul class="collapse">
                                    @if ($user->employee->canApproveRegularLeave() or $user->isAdmin())
                                    <li><a href="/leave/regular">{{ trans('system.approve') }}</a></li>
                                    @endif
                                    <li><a href="/leave/regular/apply">{{ trans('system.apply') }}</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="unselectable">
                                    {{ trans('system.special-leave') }}
                                    @if ($specialLeaveCount > 0)
                                    <span class="label label-danger pull-right">{{ $specialLeaveCount }}</span>
                                    @else
                                    <i class="arrow"></i>
                                    @endif
                                </a>

                                <!--Submenu-->
                                <ul class="collapse">
                                    @if ($user->employee->canApproveSpecialLeave())
                                    <li><a href="/leave/special">{{ trans('system.approve') }}</a></li>
                                    @endif
                                    <li><a href="/leave/special/apply">{{ trans('system.apply') }}</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="">
                        <a class="unselectable">
                            <i class="fa fa-plane"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.travel-order') }}</strong>
                            </span>
                            @if (isset($travelOrderCount) && $travelOrderCount > 0)
                            <span class="label label-danger pull-right">{{ $travelOrderCount }}</span>
                            @else
                            <i class="arrow"></i>
                            @endif
                        </a>

                        <!--Submenu-->
                        <ul class="collapse">
                            <li><a href="/travel">{{ trans('system.my-travel-orders') }}</a></li>
                            <li><a href="/travel/apply">{{ trans('system.apply-travel-order') }}</a></li>

                            @if($user->employee->canApproveTravelOrder())
                                <li>
                                    <a href="/travel/approve">Approve Travel Order Requests
                                        @if (isset($travelOrderCount) && $travelOrderCount > 0)
                                        <span class="label label-danger pull-right">{{ $travelOrderCount }}</span>
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if($user->isAdmin())
                                <li><a href="/travel/approved">{{ trans('system.approved-travel-orders') }}</a></li>
                            @endif
                        </ul>
                    </li>

                    <li class="">
                        <a href="/calendar/listings">
                            <i class="fa fa-calendar-o"></i>
                            <span class="menu-title">
                                <strong>Trainings and Seminars</strong>
                            </span>
                        </a>
                    </li>
                    @endif

                    @if(auth()->user()->isAdmin() && auth()->user()->employee)
                    <!--Menu list item-->
                    <li class="list-divider"></li>
                    <li class="list-header">{{ trans('system.admin-navigation') }}</li>
                    <li class="">
                        <a class="unselectable">
                            <i class="fa fa-users"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.employees') }}</strong>
                            </span>
                            <i class="arrow"></i>
                        </a>

                        <!--Submenu-->
                        <ul class="collapse">
                            <li><a href="/employee">{{ trans('system.view-all-employees') }}</a></li>
                            <li><a href="/positions">{{ trans('system.position-designation') }}</a></li>
                        </ul>
                    </li>

                    <li class="">
                        <a href="/calendar">
                            <i class="fa fa-calendar-o"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.calendar') }}</strong>
                            </span>
                        </a>
                    </li>

                    <li class="">
                        <a href="/departments">
                            <i class="fa fa-institution"></i>
                            <span class="menu-title">
                                <strong>{{ trans('system.departments') }}</strong>
                            </span>
                        </a>
                    </li>
                    @endif

                    <li class="list-divider"></li>
                    <li class="list-header">{{ trans('system.extras') }}</li>

                    <li class="">
                        <a href="/forms">
                            <i class="fa fa-download"></i>
                            <span class="menu-title">
                                <strong>HR Forms</strong>
                            </span>
                        </a>
                    </li>

                    <li class="unselectable">
                        <a class="unselectable">
                            <i class="fa fa-cogs"></i>
                            <span class="menu-title">
                                <strong>System</strong>
                            </span>
                            <i class="arrow"></i>
                        </a>

                        <!--Submenu-->
                        <ul class="collapse">
                            <li><a href="/system">System Information</a></li>
                            @if (auth()->user()->isAdmin())
                            <li><a href="/system/logs">Logs</a></li>
                            <li><a href="/system/active-users">Active users</a></li>
                            <li><a href="/system/config">System Configurations</a></li>
                            @endif
                            <li><a href="/system/contact-developers">Contact Developers</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</hris-sidebar>

<li class="mega-dropdown">
    <a href="#" class="mega-dropdown-toggle">
        <i class="fa fa-th-large fa-lg"></i>
    </a>
    <div class="dropdown-menu mega-dropdown-menu">
        <div class="clearfix">
            <div class="col-sm-12 col-md-3">
                <!--Mega menu widget-->
                <div class="text-center bg-danger pad-all">
                    <h3 class="text-thin mar-no">Birthdays today</h3>
                    <div class="pad-ver box-inline">
                        <span class="icon-wrap icon-wrap-lg icon-circle bg-trans-light">
							<i class="fa fa-calendar fa-4x"></i>
						</span>
                    </div>
                    <p class="pad-btm">
                        Wish them a happy birthday on their very special day!
                    </p>

                    <button @click="showBirthdaysModal = true" class="btn btn-danger">View employees</a>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <!--Mega menu list-->
                <ul class="list-unstyled">
                    <li class="dropdown-header">Profile</li>
                    <li><a href="/employee/{{ auth()->user()->username }}">Personal Data Sheet</a></li>
                    <li><a href="/employee/{{ auth()->user()->username }}/edit">Update Personal Data Sheet</a></li>
                    <li><a href="/notifications"><span v-show="notifications.length" class="pull-right badge badge-danger">@{{ notifications.length }}</span> Notifications</a></li>
                    <li><a href="/messages"><span v-show="messages.length" class="pull-right badge badge-danger">@{{ messages.length }}</span> Message</a></li>
                    <li><a href="/settings">Settings</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Calendar</li>
                    <li><a href="/calendar">Trainings and Seminar</a></li>
                    <li><a href="#">Upcoming Events</a></li>
                </ul>
            </div>
            <div class="col-sm-4 col-md-3">
                <!--Mega menu list-->
                <ul class="list-unstyled">
                    <li class="dropdown-header">Leave</li>
                    <li><a href="/leave/regular">
                        @if ($regularLeaveCount > 0)
                        <span class="pull-right label label-danger">{{ $regularLeaveCount }}</span>
                        @endif
                        Manage Regular Leave</a></li>
                    <li><a href="/leave/special">
                        @if ($specialLeaveCount > 0)
                        <span class="pull-right label label-danger">{{ $specialLeaveCount }}</span>
                        @endif
                        Manage Special Leave</a></li>
                    <li><a href="/leave/regular/apply">Apply Regular Leave</a></li>
                    <li><a href="/leave/special/apply">Apply Special Leave</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Travel order</li>
                    <li><a href="/travel">Manage</a></li>
                    <li><a href="/travel/apply">Apply</a></li>
                    <li><a href="/travel">My Travel Orders</a></li>
                </ul>
            </div>
            <div class="col-sm-4 col-md-3">
                <!--Mega menu list-->
                <ul class="list-unstyled">
                    <li class="dropdown-header">Extras</li>
                    <li><a href="/forms">Downloadable Forms</a></li>
                    <li><a href="/system/active-users">Active user</a></li>
                    <li><a href="/system">System Information</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="/system/contact-developers" class="btn btn-mint">Contact Developers</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</li>

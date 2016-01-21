<?php

Breadcrumbs::register('dashboard', function ($breadcrumbs) {
    $breadcrumbs->push(trans('breadcrumbs.dashboard'), '/dashboard');
});

Breadcrumbs::register('personal-data', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push(trans('breadcrumbs.employee-list'), '/employee');
});

Breadcrumbs::register('create-personal-data', function ($breadcrumbs) {
    $breadcrumbs->parent('personal-data');
    $breadcrumbs->push(trans('breadcrumbs.fill-up-pds'), '/employee/create');
});

Breadcrumbs::register('update-personal-data', function ($breadcrumbs, $employee) {
    $breadcrumbs->parent('show-personal-data', $employee);
    $breadcrumbs->push(trans('breadcrumbs.update-pds'));
});

Breadcrumbs::register('show-personal-data', function ($breadcrumbs, $employee) {
    $breadcrumbs->parent('personal-data');
    $breadcrumbs->push($employee->fullName(), '/employee/' . $employee->user->username);
});

Breadcrumbs::register('calendar', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push(trans('breadcrumbs.trainings-seminars'), '/calendar');
});

Breadcrumbs::register('employees', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push(trans('breadcrumbs.employee-list'), '/employee');
});

Breadcrumbs::register('departments', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push(trans('breadcrumbs.department-list'), '/departments');
});

Breadcrumbs::register('view-department', function ($breadcrumbs, $department) {
    $breadcrumbs->parent('departments');
    $breadcrumbs->push($department->name, '/departments/' . $department->code);
});

Breadcrumbs::register('positions', function ($breadcrumbs) {
    $breadcrumbs->parent('employees');
    $breadcrumbs->push(trans('breadcrumbs.position-list'), '/positions');
});

Breadcrumbs::register('system', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('System Information', '/system');
});

Breadcrumbs::register('contact-developers', function ($breadcrumbs) {
    $breadcrumbs->parent('system');
    $breadcrumbs->push(trans('breadcrumbs.contact-developers'), '/system/contact-developers');
});

Breadcrumbs::register('messages', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Messages', '/messages');
});

Breadcrumbs::register('forms', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Human Resource Forms', '/forms');
});

Breadcrumbs::register('approved-leaves', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Approved Leaves', '/leave');
});

Breadcrumbs::register('notifications', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Notification List', '/notifications');
});

Breadcrumbs::register('filed-leaves', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Filed Leaves', '/leave/personal');
});

Breadcrumbs::register('apply-regular-leave', function ($breadcrumbs) {
    $breadcrumbs->parent('filed-leaves');
    $breadcrumbs->push('Apply Regular leave', '/leave/regular/apply');
});

Breadcrumbs::register('apply-special-leave', function ($breadcrumbs) {
    $breadcrumbs->parent('filed-leaves');
    $breadcrumbs->push('Apply Special leave', '/leave/special/apply');
});

Breadcrumbs::register('filed-travel-orders', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('My Travel Orders', '/travel');
});

Breadcrumbs::register('apply-travel-order', function ($breadcrumbs) {
    $breadcrumbs->parent('filed-travel-orders');
    $breadcrumbs->push('Apply Travel Order', '/travel/apply');
});

Breadcrumbs::register('approve-regular-leave', function ($breadcrumbs) {
    $breadcrumbs->parent('approved-leaves');
    $breadcrumbs->push('Manage Regular Leave', '/leave/regular');
});

Breadcrumbs::register('approve-special-leave', function ($breadcrumbs) {
    $breadcrumbs->parent('approved-leaves');
    $breadcrumbs->push('Manage Special Leave', '/leave/special');
});

Breadcrumbs::register('approved-travel-orders', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Approved Travel Orders', '/travel/approved');
});

Breadcrumbs::register('approve-travel-order', function ($breadcrumbs) {
    $breadcrumbs->parent('dashboard');
    $breadcrumbs->push('Manage Travel Orders', '/travel/approve');
});

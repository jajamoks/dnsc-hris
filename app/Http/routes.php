<?php

Route::group(['middleware' => 'web'], function () {

    Route::auth();

});

Route::group(['middleware' => ['web', 'auth']], function () {

    Route::get('test', function () {

    });

    Route::get('lang/{locale}', 'SettingsController@changeLanguage');

    Route::get('/', 'DashboardController@index');

    Route::get('/dashboard', 'DashboardController@index');

    Route::get('settings', 'SettingsController@index');

    Route::put('settings', 'UserController@updateCredentials');

    Route::group(['prefix' => 'user'], function () {

        Route::get('/', 'UserController@index');

        Route::post('/', 'UserController@store');

        Route::put('{user}', 'UserController@update');

        Route::get('{user}/edit', 'UserController@edit');

        Route::get('create', 'UserController@create');

    });

    Route::group(['prefix' => 'employee'], function () {

        Route::get('/', 'EmployeeController@index');

        Route::post('/', 'EmployeeController@store');

        Route::get('create', 'EmployeeController@create');

        Route::get('{user}', 'EmployeeController@show');

        Route::get('{user}/edit', 'EmployeeController@edit');

        Route::put('{user}', 'EmployeeController@update');

        Route::post('/summary/export', 'EmployeeController@summary');

        Route::get('{user}/export', 'EmployeeController@export');

        Route::get('{user}/trainings', 'CalendarController@employeeTrainings');

        Route::put('{id}/leave-credits', 'EmployeeManageLeaveController@update');

        // Approval Heirarchy

        Route::get('approval-heirarchy/{employee}/create', 'EmployeeApprovalHeirarchyController@create');

        Route::get('approval-heirarchy/{employee}/edit', 'EmployeeApprovalHeirarchyController@edit');

        Route::post('approval-heirarchy/{employee}', 'EmployeeApprovalHeirarchyController@store');

        Route::put('approval-heirarchy/{employee}', 'EmployeeApprovalHeirarchyController@store');

    });

    Route::group(['prefix' => 'positions'], function () {

        Route::get('/', 'PositionController@index');

        Route::post('/', 'PositionController@store');

        Route::get('create', 'PositionController@create');

        Route::get('{id}', 'PositionController@show');

        Route::put('{id}', 'PositionController@update');

        Route::get('{id}/edit', 'PositionController@edit');

        Route::delete('{id}/delete', 'PositionController@destroy');

    });

    Route::group(['prefix' => 'leave', 'middleware' => 'employee'], function () {

        Route::get('/', 'EmployeeLeave\LeaveController@index');

        Route::get('/personal', 'EmployeeLeave\LeaveController@personal');

        Route::group(['prefix' => 'regular'], function () {

            Route::get('/', 'EmployeeLeave\RegularLeaveController@index');

            Route::post('/', 'EmployeeLeave\RegularLeaveController@store');

            Route::get('apply', 'EmployeeLeave\RegularLeaveController@create');

            Route::get('{id}', 'EmployeeLeave\RegularLeaveController@show');

            Route::put('{id}', 'EmployeeLeave\RegularLeaveController@update');

            Route::get('{id}/edit', 'EmployeeLeave\RegularLeaveController@edit');

            Route::get('{id}/download', 'EmployeeLeave\RegularLeaveController@download');

            Route::post('{id}/approve', 'EmployeeLeave\RegularLeaveController@approve');

            Route::post('{id}/reject', 'EmployeeLeave\RegularLeaveController@reject');

            Route::get('{id}/preview', 'EmployeeLeave\RegularLeaveController@preview');

            Route::post('{id}/cancel', 'EmployeeLeave\RegularLeaveController@destroy');

            Route::get('download/summary', 'EmployeeLeave\RegularLeaveController@downloadSummary');

        });

        Route::group(['prefix' => 'special'], function () {

            Route::get('/', 'EmployeeLeave\SpecialLeaveController@index');

            Route::post('/', 'EmployeeLeave\SpecialLeaveController@store');

            Route::get('apply', 'EmployeeLeave\SpecialLeaveController@create');

            Route::get('{id}', 'EmployeeLeave\SpecialLeaveController@show');

            Route::put('{id}', 'EmployeeLeave\SpecialLeaveController@update');

            Route::get('{id}/edit', 'EmployeeLeave\SpecialLeaveController@edit');

            Route::get('summary/download', 'EmployeeLeave\SpecialLeaveController@downloadSummary');

            Route::get('{id}/download', 'EmployeeLeave\SpecialLeaveController@download');

            Route::post('{id}/approve', 'EmployeeLeave\SpecialLeaveController@approve');

            Route::post('{id}/reject', 'EmployeeLeave\SpecialLeaveController@reject');

            Route::post('{id}/cancel', 'EmployeeLeave\SpecialLeaveController@destroy');

            Route::get('{id}/preview', 'EmployeeLeave\SpecialLeaveController@preview');

        });

    });

    Route::group(['prefix' => 'travel', 'middleware' => 'employee'], function () {

        Route::get('/', 'TravelController@index');

        Route::post('/', 'TravelController@store');

        Route::get('apply', 'TravelController@create');

        Route::get('approved', 'TravelController@approved');

        Route::get('approve', 'TravelController@approves');

        Route::get('{id}', 'TravelController@show');

        Route::post('{id}/approve', 'TravelController@approve');

        Route::post('{id}/cancel', 'TravelController@destroy');

        Route::post('{id}/reject', 'TravelController@reject');

        Route::get('summary/download', 'TravelController@summary');

        Route::get('{id}/download', 'TravelController@download');

        Route::get('{user}/summary', 'TravelController@employeeSummary');

    });

    Route::group(['prefix' => 'notifications'], function () {

        Route::get('/', 'NotificationController@index');

        Route::put('/', 'NotificationController@markAllRead');

        Route::put('{id}/toggle-read', 'NotificationController@toggleRead');

    });

    Route::group(['prefix' => 'calendar', 'middleware' => 'employee'], function () {

        Route::get('/', 'CalendarController@index');

        Route::post('/', 'CalendarController@store');

        Route::get('create', 'CalendarController@create');

        Route::get('download', 'CalendarController@download');

        Route::get('{id}', 'CalendarController@show');

        Route::put('{id}', 'CalendarController@update');

        Route::post('{id}/remove/{employee_id}', 'CalendarController@removeParticipant');

    });

    Route::group(['prefix' => 'departments'], function () {

        Route::get('/', 'DepartmentController@index');

        Route::post('/', 'DepartmentController@store');

        Route::get('create', 'DepartmentController@create');

        Route::get('{department}', 'DepartmentController@show');

        Route::put('{department}', 'DepartmentController@update');

        Route::get('{department}/edit', 'DepartmentController@edit');

    });

    Route::group(['prefix' => 'messages'], function () {

        Route::get('/', 'MessageController@index');

        Route::get('create', 'MessageController@create');

        Route::post('/', 'MessageController@store');

        Route::delete('/', 'MessageController@clearConversation');

        Route::delete('delete-all', 'MessageController@deleteAllMessages');

    });

    Route::group(['prefix' => 'message-group'], function () {

        Route::get('{id}/edit-participants', 'MessageGroupController@updateParticipants');

        Route::put('{id}/edit-participants', 'MessageGroupController@updateParticipants');

        Route::put('{id}/rename', 'MessageGroupController@rename');

        Route::delete('/clear-all', 'MessageGroupController@clear');

        Route::delete('{id}', 'MessageGroupController@destroy');

    });

    Route::group(['prefix' => 'todos'], function () {

        Route::get('/', 'TodoController@index');

        Route::post('/', 'TodoController@store');

        Route::put('{id}', 'TodoController@update');

        Route::put('{id}/toggle-done', 'TodoController@toggleDone');

        Route::delete('{id}/delete', 'TodoController@destroy');

        Route::delete('clear', 'TodoController@destroyAll');

    });

    Route::group(['prefix' => 'personnel-performance', 'middleware' => 'employee'], function () {

        Route::get('{user}', 'EmployeePersonnelPerformanceController@edit');

        Route::post('{id}', 'EmployeePersonnelPerformanceController@store');

    });

    Route::group(['prefix' => 'qce', 'middleware' => 'employee'], function () {

        Route::post('{user}', 'EmployeeQCEController@store');

    });

    Route::group(['prefix' => 'system'], function () {

        Route::get('/', 'SystemController@index');

        Route::get('logs', 'System\LogController@index');

        Route::get('active-users', 'System\SessionController@getActiveUsers');

        Route::get('contact-developers', 'SystemController@contactDevelopers');

        Route::post('contact-developers', 'MailController@store');

    });

    Route::group(['prefix' => 'forms'], function () {

        Route::get('/', 'FormController@index');

        Route::post('/', 'FormController@store');

        Route::get('create', 'FormController@create');

        Route::get('{id}/preview', 'FormController@preview');

        Route::get('{id}/download', 'FormController@download');

        Route::delete('{id}', 'FormController@destroy');

    });

    Route::group(['middleware' => 'api', 'prefix' => 'api', 'namespace' => 'API'], function () {

        Route::get('auth', 'UserController@getAuthenticatedUser');

        Route::get('notifications', 'NotificationController@getAllUnreadNotifications');

        Route::put('notifications/{notification}/mark-read', 'NotificationController@markRead');

        Route::group(['prefix' => 'positions'], function () {

            Route::get('/', 'PositionController@index');

            Route::post('/', 'PositionController@store');

        });

        Route::group(['prefix' => 'messages'], function () {

            Route::get('/', 'MessageController@index');

            Route::post('/', 'MessageController@store');

            Route::put('/', 'MessageController@markAllRead');

            Route::get('unread', 'MessageController@unread');

            Route::delete('{id}/delete', 'MessageController@destroy');

            Route::get('{id}', 'MessageController@show');

        });

        Route::group(['prefix' => 'employees'], function () {

            Route::get('/', 'EmployeeController@getAllEmployees');

            Route::get('recent-employees', 'EmployeeController@recentEmployees');

            Route::put('{employee}/utility', 'EmployeeController@updateEmployeeUtility');

            Route::get('birthdays', 'EmployeeController@birthdays');

        });

        Route::group(['prefix' => 'calendar'], function () {

            Route::get('/', 'CalendarController@index');

            Route::get('{id}', 'CalendarController@show');

            Route::put('{id}', 'CalendarController@update');

            Route::post('{id}', 'CalendarController@destroy');

            Route::put('{id}/toggle-include-in-pds', 'CalendarController@toggleIncludeInPds');

        });

        Route::group(['prefix' => 'departments'], function () {

            Route::get('{code}', 'DepartmentController@show');

        });

        Route::group(['prefix' => 'forms'], function () {

            Route::get('/', 'FormController@index');

        });

        Route::group(['prefix' => 'system'], function () {

            Route::get('logs', 'SystemController@getActivityLogs');

        });

    });

});

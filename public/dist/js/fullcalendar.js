'use strict'

$('#calendar').fullCalendar({
    header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
    },
    editable: true,
    eventLimit: true,
    googleCalendarApiKey: 'AIzaSyDuWWZGc4L5ev0tM5X-dO7xZEUtbLsEtNw',
    eventSources: [{
        url: '/calendar',
        type: 'GET'
    },
    {
        googleCalendarId: 'en.philippines#holiday@group.v.calendar.google.com',
        className: 'danger'
    }],
    eventClick: function (event) {
        getEvent(event);
    }
});

function getEvent(event) {
	$.ajax({
		url: '/calendar/'+event.id,
		type: 'GET',
		success: function(data) {
			bootbox.dialog({
				title: '<strong>'+event.title+'</strong>',
				message: data,
				buttons: {
                    danger: {
                        label: '<i class"fa fa-remove"></i> Delete Event',
                        className: 'btn-danger',
                        callback: function(result) {
                            bootbox.confirm({
                                message: 'Are you sure to delete this event?',
                                size: 'small',
                                buttons: {
                                    confirm: {
                                        label: 'Yes',
                                        className: 'btn-danger'
                                    }
                                },
                                callback: function (result) {
                                    if (result) {
                                        $.ajax({
                                            type: 'POST', 
                                            url: '/api/calendar/'+event.id+'/delete',
                                            success: function(data) {
                                                window.location.reload();
                                            }
                                        })
                                    }
                                }
                            });
                        }
                    },
                    main: {
                        label: 'Close',
                        className: "btn-default"
                    }
                }
			});
		},
		error: function() {
			bootbox.alert("Cannot fetch event!");
		}
	});
}

function newEvent() {
    $.get('/calendar/create', function(data) {
        bootbox.dialog({
            size: 'large',
            title: '<i class="fa fa-calendar-plus-o"></i> New Trainings and Seminar',
            message: data,
            animateIn: 'flipInX',
            animateOut : 'flipOutX'
        }).bind('mousemove', function() {
            console.log($('#participants'));
            $('#participants').chosen({width: '100%'}).trigger("liszt:updated");
            $('.input-daterange').datepicker({
                format: "yyyy-mm-dd",
                todayBtn: "linked",
                autoclose: true,
                todayHighlight: true
            });
        });
    });
}

function removeParticipant(training, employee) {
    bootbox.confirm({
        message: 'Are you sure you want to remove <strong>'+employee.first_name+' '+employee.surname+'</strong> as a participant of the event "<strong>'+training.title+'</strong>"?',
        size: 'small',
        buttons: {
            confirm: {
                label: '<i class="fa fa-remove"></i> Yes',
                className: 'btn-danger'
            }
        },
        callback: function(result) {
            if (result) {
                $.ajax({
                    url: '/calendar/'+training.id+'/remove/'+employee.id,
                    type: 'POST',
                    success: function(data) {
                        if (data.success) {
                            window.location.reload();
                        }
                    }
                })
            }
        },
        animateIn: 'swing',
        animateOut : 'hinge'
    });
}
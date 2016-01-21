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
        url: '/api/calendar',
        type: 'GET'
    }, {
        googleCalendarId: 'en.philippines#holiday@group.v.calendar.google.com',
        className: 'danger'
    }],
    eventClick: function(event) {
        window.location.replace('/calendar/' + event.id);
    }
});

$('#participants').chosen({
    width: '100%'
}).trigger("liszt:updated");

$('.input-daterange').datepicker({
    format: "yyyy-mm-dd",
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
});

function deleteEvent(event) {
    swal({
        title: "Delete training / seminar",
        text: "Are you sure to remove this training and seminar? This will not be recovered once deleted.",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "delete",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.post('/api/calendar/' + event.id)
            .success(function(message) {
                swal({
                    title: 'Trainings / Seminar deleted!',
                    text: message,
                    type: 'success',
                    confirmButtonText: 'Close',
                }, function() {
                    window.location.reload();
                });
            }).error(function() {
                swal("Error", "Oopss! Looks like we've got an error.", "error");
            })
    });
}

(function() {

    'use strict'

    $('a.approve').on('click', function(event) {
        event.preventDefault();
        var link = $(this).attr('href');
        swal({
            title: "Approve leave",
            text: "Are you sure to approve this leave?",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Approve leave",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        }, function() {
            $.post(link)
                .success(function() {
                    swal({
                        title: 'Leave approved',
                        text: 'The leave request has been approved!',
                        type: 'success',
                        confirmButtonText: 'Close',
                    }, function() {
                        window.location.replace('/');
                    });
                })
                .error(function() {
                    swal('Error', 'We cannot approve this leave request.', 'error');
                });
        });
    });

    $('a.reject').on('click', function(event) {
        event.preventDefault();
        var link = $(this).attr('href');
        swal({
            title: "Reject request",
            text: "Are you sure to reject this request?",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Reject",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        }, function() {
            $.post(link)
                .success(function(data) {
                    swal({
                        title: 'Rejected',
                        text: data,
                        type: 'success',
                        confirmButtonText: 'Close',
                    }, function() {
                        window.location.replace('/');
                    });
                })
                .error(function() {
                    swal('Error', 'We cannot process this request.', 'error');
                });
        });
    });

})();

function rejectLeave(leave) {
    swal({
        title: "Disapprove leave",
        text: "Disapprove leave due to?",
        type: "input",
        showCancelButton: true,
        closeOnConfirm: false,
        animation: "slide-from-top",
        inputPlaceholder: "Write something...",
        showLoaderOnConfirm: true
    }, function(remarks) {
        if (remarks === false) return false;
        $.post('/leave/regular/' + leave.id + '/reject', {
            remarks: remarks
        }).success(function() {
            swal({
                title: 'Leave rejected',
                text: 'The leave request has been rejected!',
                type: 'success',
                confirmButtonText: 'Close',
            }, function() {
                window.location.replace('/');
            });
        });
    });
}

function cancelRegularLeave(leave) {
    swal({
        title: "Cancel Leave",
        text: "Are you sure to cancel this leave? This will be deleted after cancelling.",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Continue",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.post('/leave/regular/' + leave.id + '/cancel')
            .success(function(data) {
                if (data.success) {
                    swal({
                        title: 'Leave cancelled',
                        text: 'Leave has been successfully canceled and deleted!',
                        type: 'success',
                        confirmButtonText: 'Close',
                    }, function() {
                        window.location = '/leave/personal';
                    });
                }
            }).error(function() {
                swal("Unsuccessful", "Something went wrong behind the scene.", "error");
            });
    });
}

function cancelSpecialLeave(leave) {
    swal({
        title: "Cancel Special Leave",
        text: "Are you sure to cance this leave? This will be deleted after cancelling.",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Continue",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.post('/leave/special/' + leave.id + '/cancel')
            .success(function(data) {
                if (data.success) {
                    swal({
                        title: 'Special Leave cancelled',
                        text: 'The special leave was cancelled and deleted!.',
                        type: 'success',
                        confirmButtonText: 'Close',
                    }, function() {
                        window.location = '/leave/personal';
                    });
                }
            }).error(function() {
                swal("Unsuccessful", "Something went wrong behind the scene.", "error");
            });
    });
}

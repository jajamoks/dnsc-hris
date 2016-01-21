(function() {

    'use strict'

    $.get('/api/auth', function(user) {
        // Pusher API
        var pusher = new Pusher('84cb96c4004fd7ebf124', {
            encrypted: true
        });

        var channel = pusher.subscribe('user.' + user.id);

        channel.bind('DNSCHumanResource\\Events\\NotificationCreated', function(data) {
            // Increment if incoming notification arrive
            var notificationCount = $('span.notification').html();
            $('span.notification').text(++notificationCount);
            $.niftyNoty({
                type: 'dark',
                icon: 'fa fa-' + data.notification.icon,
                title: data.notification.subject,
                message: data.notification.message,
                container: 'floating',
                timer: 8000
            });
            $('#notificationSound')[0].play();
        });
    });
})();

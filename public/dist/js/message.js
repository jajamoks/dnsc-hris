function sendMessage(user) {
    bootbox.prompt('Send a message', function(result) {
        if (result) {
            $.post('/messages', {
                recipient: user.id,
                message: result
            }).success(function() {
                $.niftyNoty({
                    type: 'dark',
                    icon: 'fa fa-envelope',
                    title: 'Success',
                    message: 'Message sent!',
                    container: 'floating',
                    timer: 8000
                });
            });
        }
    });
}

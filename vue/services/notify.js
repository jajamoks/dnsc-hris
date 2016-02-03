export default {

	show(notification) {

		$.niftyNoty({
            type: 'dark',
            icon: 'fa fa-' + notification.icon,
            title: notification.subject,
            message: notification.message,
            container: 'floating',
            timer: 5000
        });

		var notif = new Notification(notification.subject, {
			icon: notification.sent_by_user.photo,
			body: notification.message
		})

		window.setTimeout(() => {
			notif.close();
		}, 5000);

	}

}
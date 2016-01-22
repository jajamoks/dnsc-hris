Vue.filter('date', function(value, format) {

    if (format === 'relative') {
        return moment(value).fromNow();
    }

    return moment(value).format(format);

});

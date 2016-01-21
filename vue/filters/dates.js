Vue.filter('date', function(value, format) {

    return moment(value).format(format);

});

Vue.filter('defaultTo', function(value, message) {

    if (value) return value;

    return message;

});

Vue.filter('pluralize', function(value, string) {

    var value = parseInt(value);

    var lastLetter = string.charAt(parseInt(string.length - 1));

    var except = ['y'];

    if (value == 0) {
        return 'No ' + string;
    } else if (value > 1) {
        return value + ' ' + string + 's';
    } else {
        return value + ' ' + string;
    }

});

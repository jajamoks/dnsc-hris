window.Vue = require('vue');

require('vue-resource');

// Set true if you want to show the error message while on dev

Vue.config.debug = true;

// Fetch token in the meta tag in order to process token based request

Vue.http.headers.common['X-CSRF-TOKEN'] = $('meta[name="csrf-token"]').attr('content');

// Load ladda button loading state spinner

window.Ladda = require('ladda');

window.laddaButton = Ladda.bind('button[type=submit]');

// Load the rest of the files needed in my vue application

window.socket = io.connect('http://localhost:8890');

window.AUTH_USER = USER;

require('./core/components');
require('./core/filters');
require('./core/directives');

new Vue({

    el: '#hris',

});

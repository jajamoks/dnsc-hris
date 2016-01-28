var config = require('./config');

window.io = require('socket.io-client');

window.socket = io(config.server.host);

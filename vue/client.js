var config = require('./config');

window.io = require('socket.io/node_modules/socket.io-client');

window.socket = io(config.server.host);

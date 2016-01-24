var config = require('./vue/config');

var io = require('socket.io')(config.server.port);

console.log('Connected to server...');

var Redis = require('ioredis');
var redis = new Redis();

io.on('connection', function(socket) {
    console.log('- New client connected...')
});

redis.psubscribe('*', function(err, count) {
    console.log(err);
});

redis.on('pmessage', function(subscribed, channel, message) {
    console.log('+ Message received on channel: ' + channel);
    io.emit(channel, JSON.parse(message));
});

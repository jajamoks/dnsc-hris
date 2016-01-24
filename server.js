require('./config');

var io = require('socket.io')(8890);

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
    console.log('+ Message received!');
    io.emit(channel, JSON.parse(message));
});

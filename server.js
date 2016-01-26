var config = require('./vue/config');

var app = require('http').createServer(handler);
var io = require('socket.io')(app);

var Redis = require('ioredis');
var redis = new Redis();

app.listen(config.server.port, function() {
    console.log('Server connected...')
})

function handler(req, res) {
    res.writeHead(200);
    res.end('');
}

io.on('connection', function(socket) {
    console.log('- New client connected...')
});

redis.psubscribe('*', function(err, count) {
    console.log();
});

redis.on('pmessage', function(subscribed, channel, message) {
    console.log('+ Message sent on channel: ' + channel);
    io.emit(channel, JSON.parse(message));
});

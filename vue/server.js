// var app = require('express')();
// var server = require('http').Server(app);
// var io = require('socket.io')(server);
// var redis = require('redis');

// server.listen(8890, function() {
//     console.log('connected...');
// });

// io.on('connection', function(socket) {

//     console.log("new client connected");
//     var redisClient = redis.createClient();
//     redisClient.subscribe('message');

//     redisClient.on("message", function(channel, message) {
//         console.log("mew message in queue " + JSON.parse(message) + "channel");
//         socket.emit(channel, message);
//     });

//     socket.on('disconnect', function() {
//         redisClient.quit();
//     });

// });

var app = require('http').createServer(handler);
var io = require('socket.io')(app);

var Redis = require('ioredis');
var redis = new Redis();

app.listen(8890, function() {
    console.log('Server is running...\n');
})

function handler(request, response) {
    response.writeHead(200);
    response.end('');
}

io.on('connection', function(socket) {
    console.log("New client connected...\n");
    var redisClient = Redis.createClient();
    redisClient.subscribe('message');

    redisClient.on("message", function(channel, message) {
        console.log("New message in queue " + JSON.parse(message) + "channel");
        socket.emit(channel, message);
    });

    socket.on('disconnect', function() {
        redisClient.quit();
    });
});

// redis.psubscribe('*', function(err, count) {
//     //
// });

// redis.on('message', function(subscribed, channel, message) {
//     message = JSON.parse(message);
//     io.emit(channel + ':' + message.event, message.data);
// });

'use strict';
var Hapi = require('hapi');
var server = new Hapi.Server(3000, '0.0.0.0');

server.route({
    method: 'GET',
    path: '/{param*}',
    handler: {
        directory: {
            path: 'dist'
        }
    }
});

// Start the server
server.start(function () {
  console.log('Server started at port ' + server.info.port);
});

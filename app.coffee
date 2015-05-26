Server = require './index'
config = require './config'

server = new Server(config)

server.start();

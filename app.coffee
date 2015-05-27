Server = require './index'
config = require './config'

models = require './models/index'

server = new Server(config.web, models.Provider)

server.start();

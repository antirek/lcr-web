express = require 'express'
app = express()
app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'jade'

app.get '/', (req, res)->
  res.render 'index'
app.use '/bower_components', express.static "#{__dirname}/bower_components"
app.use '/public', express.static "#{__dirname}/public"

app.get '/partials/:folder/:view', (req, res)->
  res.render "partials/#{req.params.folder}/#{req.params.view}"

models = require './models/index'
createRest = require './model'
app.use '/providers', createRest models.Provider

app.listen 3000
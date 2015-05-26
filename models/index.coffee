mongoose = require 'mongoose'
Schema = mongoose.Schema

db = mongoose.createConnection 'mongodb://localhost/lcr'
provider = require './provider'
module.exports =
  Provider: db.model 'provider', new Schema provider
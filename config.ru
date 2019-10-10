require 'sinatra/base'
require_relative 'app/controllers/mars_explore_controller'
require 'mongoid'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map('/') { run MarsExplorerController }

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'mars_db',
  }

  config.log_level = :info
end
require 'sinatra/base'
require_relative 'app/controllers/mars_explore_controller'
require 'mongoid'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map('/') { run MarsExploreController }

Mongoid.configure do |config|
  mongo_host = ENV.fetch('MONGO_HOST', 'localhost')
  config.clients.default = {
    hosts: ["#{mongo_host}:27017"],
    database: 'mars_db',
  }

  config.log_level = :info
end

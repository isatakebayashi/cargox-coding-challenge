require 'sinatra/base'
require_relative 'app/controllers/example_controller'
require 'mongoid'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

# map('/example') { run ExampleController }
map('/') { run ExampleController }

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'mars_db',
  }

  config.log_level = :info
end
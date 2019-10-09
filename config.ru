require 'sinatra/base'
require_relative 'app/controllers/example_controller'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

# map('/example') { run ExampleController }
map('/') { run ExampleController }
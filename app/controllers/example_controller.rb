require_relative 'application_controller'
require_relative '../mars_explore'
require 'pry-byebug'

class ExampleController < ApplicationController
  get '/' do
    erb :index
  end

  post '/upload' do
    file = params[:file][:tempfile]
    mars = MarsExplore.explore(file)
    args = JSON.dump(mars.to_h)
    redirect to("/result?args=#{args}")
  end

  get '/result' do
    @data = JSON.parse(params[:args])
    erb :result
  end
end
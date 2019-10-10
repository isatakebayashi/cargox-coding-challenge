require_relative 'application_controller'
require_relative '../lib/mars_explore'
require_relative '../models/mars_surface'

require 'pry-byebug'

class MarsExplorerController < ApplicationController
  get '/' do
    erb :index
  end

  post '/upload' do
    file = params[:file][:tempfile]
    mars_surface = MarsExplore.explore(file).to_h

    puts mars_surface.to_h
    
    stored_surface = MarsSurface.new(
      {
        top_x: mars_surface[:x],
        top_y: mars_surface[:y],
        robots: mars_surface[:robots]
      }
    )
    stored_surface.save!
    
    redirect to("/show?id=#{stored_surface.id}")
  end

  get '/show' do
    id = params[:id]
    @surface = MarsSurface.find(id)
    erb :show
  end
end
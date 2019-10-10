require_relative 'application_controller'
require_relative '../lib/mars_explore'
require_relative '../models/mars_surface'

class MarsExploreController < ApplicationController
  get '/' do
    erb :index, :layout => :layout
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
    erb :show, :layout => :layout
  end

  error do
    @error = 'Erro desconhecido'
    erb :error, :layout => :layout
  end

  error Surface::InvalidSurfaceCoordinatesError do
    @error = 'Não foi possível encontrar coordenadas de superficie no arquivo'
    erb :error, :layout => :layout
  end

  error Robot::InvalidRobotCoordinatesError do
    @error = 'Não foi possível validar as coordenadas para esse robô'
    erb :error, :layout => :layout
  end
end

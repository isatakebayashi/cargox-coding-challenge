class ApplicationController < Sinatra::Base
  # configure do
  #   set :views, "app/views"
  # end

  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    erb :index
  end
end
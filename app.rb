require 'sinatra/base'
require 'haml'
require 'sass'
require 'coffee-script'

require_relative 'models/init'
require_relative 'models/orders'

class Server < Sinatra::Base
  get '/' do
    haml :index
  end 

  get '/home' do
    haml :index
  end 

  get '/make' do
    haml :make
  end

  post '/create-order' do
    #"test #{params[:str]}"
    Orders.create(params[:str])
  end
end

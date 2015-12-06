require 'sinatra/base'
require 'haml'
require 'sass'
require 'coffee-script'

require_relative 'models/init'
require_relative 'models/orders'

class Server < Sinatra::Base
  get '/' do
    @f = Orders.get_order_titles
    haml :index
  end 

  get '/make' do
    haml :make
  end

  get '/input-data' do

  end

  post '/create-order' do
    #"test #{params[:str]}"
    @f = Orders.get_order_titles
    Orders.create(params[:title],params[:field])
    haml :index
  end
end

require 'sinatra/base'
require 'haml'
require 'sass'
require 'coffee-script'

require_relative 'models/init'
require_relative 'models/orders'
require_relative 'models/users'

class Server < Sinatra::Base
  get '/' do
    @f = Orders.get_order_titles
    haml :index
  end 

  get '/make' do
    haml :make
  end

  get '/input-data/:order_key' do
    @order_elements = Orders.get_order_eletemts(params[:order_key])
    @order_key = params[:order_key]
    haml :inputdata
  end

  get '/show-usrs-data/:order_key' do
  
  end

  post '/create-order' do
    #"test #{params[:str]}"
    @f = Orders.get_order_titles
    Orders.create(params[:title],params[:field])
    haml :index
  end

  get '/inputdata.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :inputdata
  end

  post '/confirm-userdata' do
    @obj = params
    haml :confirmuserdata
  end

  post '/create-user' do
    Users.create(params)
    redirect to('/')
  end
end

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

  get '/show-users-data/:order_key' do
    @titles = Orders.get_order_titles
    @title = @titles[params[:order_key]]
    @users_data = Users.get_inputed_date(params[:order_key])
    haml :ShowUsersData
  end

  post '/add-order-object' do
    @titles = Orders.get_order_titles
    @title = @titles[params[:hash]]
    @order_key = params[:hash]
    haml :AddOrderObject
  end

  post '/create-order' do
    @f = Orders.get_order_titles
    Orders.create(params[:title],params[:field])
    redirect to('/')
  end

  post '/add-order' do
    Orders.add_order_object(params[:order_key_hash],params[:field])
    redirect to('/input-data/' + params[:order_key_hash])
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

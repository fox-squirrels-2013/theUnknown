require 'sinatra'
require 'active_record'
require_relative './app/models/user'
require_relative './app/models/drawing'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'theU')


get '/'  do 
	
	erb :index
end
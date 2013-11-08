require 'sinatra'
require 'active_record'
require 'json'

require_relative './app/models/user'
require_relative './app/models/drawing'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'theU')

get '/'  do 
	erb :index
end

post '/changeattr' do
	color = params[:color]
	line_width = params[:line_width]
	content_type :json
	attributes = {:color => color, :line_width => line_width}
	return attributes.to_json
end
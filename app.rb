require 'sinatra'
require 'active_record'
require 'json'

get '/'  do 
	erb :index
end

post '/changeattr' do
	puts params
	color = params[:color]
	line_width = params[:line_width]
	attributes = {:color => color, :line_width => line_width}
	return attributes.to_json
end
require 'sinatra'
require 'active_record'
require 'active_support'
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


def logged_in?
  session[:user_id].present?
end

def current_user
  @current_user ||= logged_in? && User.find( session[:user_id] ) 
end


###### save route

post '/save-image' do
  

	#redirect if !logged_in?

	# save the file using params data
    drawing = current_user.drawings.new(params[:drawing])
    if drawing.save
      if request.xhr?
        return [ 200,  
          {"Content-Type" => "text/plain"}, # the hash of headers
          ["Saved successfully"]     
          ]
      else
        	redirect "/show-image/#{drawing.id}"
      end  # redirect to display image
    else
      # render error
    end
end

get '/show-image/:id' do
   @drawing = Drawing.find( params[:id] )
   
   erb :"show-image"
end
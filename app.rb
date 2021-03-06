require 'sinatra'
require 'active_record'
require 'active_support'
require 'json'

require_relative './app/models/user'
require_relative './app/models/drawing'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'theU')

enable :sessions

# before  '/createaccount' do
#   unless logged_in redirect '/'
# end

def check_if_valid_user(email,password)
	user = User.find_by_email(email)
	if user
		return true if user.password == password
	end
	return false
end

# session[:user_id]
get '/'  do
	erb :index
end

post '/login' do

	if check_if_valid_user(params[:email], params[:password])
		user = User.where(email: params[:email], password: params[:password]).take
		session[:user_id] = user.id
      p "Session #{session}"
		return 'true'
	else
		return 'false'
	end
end

post '/createaccount' do
	user = User.create params
	"Your email was invalid!" unless user.id
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
  return nil unless logged_in?
  @current_user ||=  User.find( session[:user_id] )
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

get '/logout' do
	session.clear
	redirect '/'
end
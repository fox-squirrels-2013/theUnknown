require 'sinatra'
require 'active_record'
require 'json'

require_relative './app/models/user'
require_relative './app/models/drawing'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'theU')

enable :sessions

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

get '/logout' do
	session.clear
	redirect '/'
end
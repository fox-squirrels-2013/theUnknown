require 'sinatra'
require 'active_record'


get '/'  do 
	erb :index
end

post '/changecolor' do
	puts params
	
	@color = params[:color]

	@color

end
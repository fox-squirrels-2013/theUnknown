require 'spec_helper'
require './app/models/drawing'
require './app/models/user'

describe User do 

	# before :each do 
	# 	@user = User.new(name: 'John', email: 'asdf@aasdf.com', password: '1234')
	# end

	describe '#new' do
		# This test tests active record, rather than our code [not a good test]
		# it 'returns a new user object' do
		# 	@user.should be_an_instance_of User
		# end	


		it 'without email parameter, user will not be saved' do
			user = User.new(name: 'jerry', password: 'abcd')
			user should_be nil
		end

		# it 'Tests that e-mail addresses are unique' do
		# 	should validate_uniqueness_of(:email)	
		# end

		# it 'Tests that a password is set' do
		# 	should validate_presence_of(:password)
		# end

		# it 'tests that the user has a name' do
		# 	should validate_presence_of(:name)
		# end
	end	
end

# describe Drawing do

# 	before :each do
# 		@drawing = Drawing.new 'user', 'title', 'url'
# 	end

# 	describe '#new_drawing' do
# 		it 'returns a new drawing object' do
# 			@drawing.should be_an_instance_of Drawing
# 		end

# 		it 'checks that a drawing belongs_to a user' do

# 		end

# 		it 'checks that a drawing url can be saved' do

# 		end

# 		it 'checks that a drawing has a title' do
# 			should validate_presence_of(:title)
# 		end
# 	end

# end


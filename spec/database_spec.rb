require 'spec_helper'

describe User do 

	before :each do 
		@user = User.new 'name', 'email', 'password'
end

	describe '#new' do
		it 'returns a new user object' do
			@user.should be_an_instance_of User
		end	

		it 'takes 3 parameters and returns a User' do
			user = User.new 'name', 'email'
			user.should_not be_an_instance_of User
		end
	end	
end
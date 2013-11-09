class User < ActiveRecord::Base
	has_many :drawings
	# validates :name, :password, :email, presence: true
end	

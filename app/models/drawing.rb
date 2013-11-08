class Drawing < ActiveRecord::Base
	belongs_to :user

	validates :name, :email, :password, presence: true
	validates :email, uniqueness: true
end	


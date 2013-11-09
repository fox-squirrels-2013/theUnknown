class User < ActiveRecord::Base
	has_many :drawings
	validates :email, presence: true, uniqueness: true
  validates :password, presence:true
  validates :name, presence:true
end

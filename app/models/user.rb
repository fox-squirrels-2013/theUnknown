class User < ActiveRecord::Base
	has_many :drawings
	validates :email, format: { with: /\A.+@{1}.+\.{1}.{2,}\z/,
    message: "INVALID EMAIL SON" }
end	

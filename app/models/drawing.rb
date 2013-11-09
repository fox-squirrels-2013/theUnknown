class Drawing < ActiveRecord::Base
	belongs_to :user

	validates :title, :image_data, presence: true
	 
end	


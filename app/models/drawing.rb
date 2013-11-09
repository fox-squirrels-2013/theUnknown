class Drawing < ActiveRecord::Base
	belongs_to :user
  validates :user, presence: true
	validates :title, presence: true
end


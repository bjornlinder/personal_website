class Comment < ActiveRecord::Base
	belongs_to :post
	validates :post, presence: true
	validates :comment, presence: true

end
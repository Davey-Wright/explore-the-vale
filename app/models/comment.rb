class Comment < ApplicationRecord
	
	# Allows User model to access the Comment model
	belongs_to :user

end

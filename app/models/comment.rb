class Comment < ApplicationRecord
	
	# Allows User model to access the Comment model
	belongs_to :user

	RATINGS = {
		'one star': '1_star',
    'two stars': '2_stars',
    'three stars': '3_stars',
    'four stars': '4_stars',
    'five stars': '5_stars'
	}
	
	# invert the RATINGS hash so the keys are more readable
	# we can access this in our view in our select dropdown
	def humanized_rating
		RATINGS.invert[self.rating]
	end

end

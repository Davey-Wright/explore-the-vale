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
	
	# Invert the RATINGS hash so values are more readable then return the value of the instance rating
	# Can also be written like... 
	# inverted_rating = RATINGS.invert
	# inverted_rating[self.rating]

	def humanized_rating
		RATINGS.invert[self.rating]
	end

end

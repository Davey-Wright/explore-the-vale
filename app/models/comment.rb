class Comment < ApplicationRecord
	
	# Allows Comment model to acces User model and vice versa
	belongs_to :user
	belongs_to :place

	# using acitve record callback after_create to call method send_comment_email
	after_create :send_comment_email

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


	# PRIME EXAMPLE of OOP using the NotificationMailer class and its comment_added method to send an email
	# wrapping this line of code creates a method that belongs to the Comment class and will allow us to call this
	# method from Comment and send out emails
	def send_comment_email
		NotificationMailer.comment_added(self).deliver_now
	end

end

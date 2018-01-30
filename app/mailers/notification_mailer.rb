class NotificationMailer < ApplicationMailer

	default from: 'd.dawg.apps@gmail.com'

	def comment_added(comment)
		@place = comment.place
		@place_owner = @place.user

		# mail method sends the email
		mail(to: @place_owner.email, subject: "A comment has been added to #{ @place.title }")
	end

end

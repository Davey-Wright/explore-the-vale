class NotificationMailer < ApplicationMailer

	default from: 'shaka.boom.boom@explore-the-vale.co.uk'

	def comment_added
		mail(to: "davey.wright@gmail.com", subject: "A comment has been added to your place")
	end

end

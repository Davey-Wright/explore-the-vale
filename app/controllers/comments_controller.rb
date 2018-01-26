class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create

		# find current place from id given in the URL
		@place = Place.find(params[:place_id])

		# create new comment in comments table and merge/add current user(user who just commented) to comment_params 
		@place.comments.create(comment_params.merge(user: current_user))

		# redirect user to place page they recently made a comment on
		redirect_to place_path(@place)
	end

	private

	def comment_params
		# allows parameters to be used
		# :comment is the submitted form, which is sent through params
		# :message, :rating are the submitted fields of the form, here we are saying its okay to use these
		params.require(:comment).permit(:message, :rating)
	end
end

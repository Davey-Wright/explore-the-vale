class PlacesController < ApplicationController
	
	def index
		@places = Place.all.page params[:page]
	end

	def new
		@places = Place.new
	end

	def create
		
	end

end

# binding.pry

# [1, 2, 3].map { |n|  n.to_s }
# [1, 2, 3].map(&:to_s)

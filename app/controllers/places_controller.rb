class PlacesController < ApplicationController
	
	def index
		@places = Place.all.page params[:page]
	end

	def new
		@places = Place.new
	end

end

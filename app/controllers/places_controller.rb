class PlacesController < ApplicationController
	
	def index
		@places = Place.all params[:page]
	end

end

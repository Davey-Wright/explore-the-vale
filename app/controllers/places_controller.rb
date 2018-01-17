class PlacesController < ApplicationController
	
	def index
		@places = Place.all.page params[:page]
	end

	def new
		@places = Place.new
	end

	def create
		params[:place][:time] = params[:place][:hours] + ":" + params[:place][:minutes]
		Place.create( place_params )
		redirect_to root_path
	end

private
	
	def place_params
		params.require(:place).permit(:title, :difficulty, :time, :distance, :description, :directions, {terrain: []} )
	end

end

# [1, 2, 3].map { |n|  n.to_s }
# [1, 2, 3].map(&:to_s)

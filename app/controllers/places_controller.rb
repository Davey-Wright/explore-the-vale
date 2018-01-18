class PlacesController < ApplicationController
	
	before_action :authenticate_user!, only: [ :new, :create ]

	def index
		@places = Place.all.page params[:page]
	end

	def new
		@places = Place.new
	end

	def create
		params[:place][:time] = params[:place][:hours] + ":" + params[:place][:minutes]
		current_user.places.create( place_params )
		redirect_to root_path
	end

	def show
		@place = Place.find( params[:id] )
	end

private
	
	def place_params
		params.require(:place).permit(:title, :difficulty, :time, :distance, :description, :directions, {terrain: []} )
	end

end

# [1, 2, 3].map { |n|  n.to_s }
# [1, 2, 3].map(&:to_s)

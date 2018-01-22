class PlacesController < ApplicationController
	
	before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

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

	def edit
		@place = Place.find( params[:id] )

		if @place.user != current_user
			return render text: 'Access Denied!', status: :forbidden
		end
	end

	def update
		@place = Place.find( params[:id] )

		if @place.user != current_user
			return render text: 'Access Denied!', status: :forbidden
		end

		@place.update_attributes( place_params )
		redirect_to root_path
	end

	def destroy
		@place = Place.find( params[:id] )

		if current_user != @place.user 
			return render text: 'Access Denied!', status: :forbidden
		end
		@place.destroy
		redirect_to root_path
	end

private
	
	def place_params
		params.require(:place).permit(:title, :difficulty, :time, :distance, :description, :directions, {terrain: []} )
	end

end

# [1, 2, 3].map { |n|  n.to_s }
# [1, 2, 3].map(&:to_s)

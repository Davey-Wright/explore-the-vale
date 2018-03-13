class PlacesController < ApplicationController
	
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@place = Place.all.page params[:pages]
	end


	def new
		@place = Place.new
	end


	def create
		@place = Places::CreatePlace.new(current_user, place_params, time_params).call

		if @place.valid?
			redirect_to root_path	
		else
			render :new, status: :unprocessable_entity
		end
	end


	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
		@photos = Photo.new
	end


	def edit
		@place = Place.find(params[:id])

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
	
		if @place.valid?
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
		
	end


	def destroy
		@place = Place.find( params[:id] )

		if current_user != @place.user 
			return render text: 'Access Denied!', status: :forbidden
		end
		# @place.user.comments.where(place_id: params[:id]).destroy_all
		@place.destroy
		redirect_to root_path
	end


private
	
	def place_params
		params.require(:place).permit(:title, :difficulty, :distance, :description, :directions, {terrain: []}, :address )
	end


# cant add these to place_params because Place model does not have these attributes, and were using place_params to create new place
	def time_params
		params.require(:place).permit(:hours, :minutes)
	end

end


class PlacesController < ApplicationController
	
	before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

	def index
		@place = Place.all.page params[:page]
	end


	def new
		@place = Place.new
	end


	def create

		h = params[:place][:hours]
		m = params[:place][:minutes]

		if h.present? || m.present?
			params[:place][:time] = h + ":" + m
		end

		@place = current_user.places.create( place_params )

		binding.pry

		if @place.valid?
			redirect_to root_path	
		else
			render :new, status: :unprocessable_entity
		end
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

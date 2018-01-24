module Places
	class CreatePlace

		attr_accessor :user, :place_params, :time_params

		def initialize(current_user, place_params, time_params)
			@user = current_user
			@place_params = place_params
			@time_params = time_params
		end

		def calculate_time_to_minutes
			time = time_params[:hours].to_i * 60 + time_params[:minutes].to_i
			time.to_s
		end

		def call
			user.places.create(place_params.merge(time: calculate_time_to_minutes))
		end

	end
end

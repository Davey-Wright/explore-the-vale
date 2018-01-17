class PlacesController < ApplicationController
	
	def index
		@places = Place.all.page params[:page]
	end

	def new
		@places = Place.new
	end

	def create
		binding.pry
	end

end


# [1, 2, 3].map { |n|  n.to_s }
# [1, 2, 3].map(&:to_s)

##
#	    	<%= f.input :time, 
#	    			as: :float,
#	    			label: false,
#	    			input_html: { min: 0 },
#	    			placeholder: 'Hours'
#	    	%>
#	    	<div>
#		    	<%= f.input :time, 
#	    				as: :float,
#	    				label: false,
#	    				input_html: { max: 55, min: 0 },
#	    				placeholder: 'Minutes'
#	    		%>

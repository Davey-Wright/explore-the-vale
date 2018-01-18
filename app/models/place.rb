class Place < ApplicationRecord

	def self.terrain_options
		['Sand', 'Grass', 'Rocks', 'Marsh', 'Hilly']

	end

	belongs_to :user

end
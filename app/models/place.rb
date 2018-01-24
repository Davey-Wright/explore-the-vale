class Place < ApplicationRecord

	def self.terrain_options
		['Sand', 'Grass', 'Rocks', 'Marsh', 'Hilly']
	end

	belongs_to :user

	geocoded_by :address
	after_validation :geocode

	validates :title, presence: { message: 'Please enter a title for your route.' }
	validates :difficulty, presence: { message: 'Please choose a level of difficulty.' }
	validates :time, presence: { message: 'Please enter the time it takes to walk this route.' }
	validates :distance, presence: { message: 'Please enter the distance of this route.' }
	validates :terrain, length: { minimum: 2, message: 'Please select at least one of the terrain types' }
	validates :address, presence: { message: 'Enter the address so it can be pinned on a map'}

end


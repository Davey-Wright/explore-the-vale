class Photo < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	belongs_to :user
	belongs_to :place
end

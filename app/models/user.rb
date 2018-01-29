class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Allows User to access Place model and Comment model
  # pluralization occurs when specifying has_many
  has_many :places
  has_many :comments
  has_many :photos
end

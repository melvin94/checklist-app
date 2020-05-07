class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_one_attached :profile_picture

  belongs_to :role

  validates_presence_of :entity_name
  validates :email, uniqueness: true
  validates_presence_of :password_confirmation
end

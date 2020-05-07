class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_one_attached :profile_picture

  belongs_to :role

  validates_presence_of :name
  validates :registration_number, uniqueness: true
  validates_presence_of :address
  validates_presence_of :phone_number
  validates :email, uniqueness: true
  validates_presence_of :password
  validates_presence_of :password_confirmation
end

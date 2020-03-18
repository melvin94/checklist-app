class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_one_attached :profile_picture

  belongs_to :access_level
  belongs_to :role

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :role
  validates_presence_of :access_level
  validates :email, uniqueness: true
  validates_presence_of :password_confirmation
end

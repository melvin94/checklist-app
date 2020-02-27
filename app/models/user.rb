class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  belongs_to :access_level
  belongs_to :role

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :role_id
  validates_presence_of :email
  validates :email, uniqueness: true
  validates_presence_of :password
end

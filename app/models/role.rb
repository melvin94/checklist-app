class Role < ApplicationRecord
  validates_presence_of :description
  has_many :users
end

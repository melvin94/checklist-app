class Role < ApplicationRecord
  # validates_presence_of :title
  has_many :users
end

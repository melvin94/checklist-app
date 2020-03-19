class AccessLevel < ApplicationRecord
  has_many :users

  validates_presence_of :title
  validates_presence_of :level
end

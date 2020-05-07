class Job < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :category
  validates_presence_of :description
  validates_presence_of :status
  validates_presence_of :created_by
  #   validates :registration_number, uniqueness: true
end

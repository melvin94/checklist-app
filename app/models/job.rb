class Job < ApplicationRecord
  has_many_attached :images

  validates_presence_of :title
  validates_presence_of :category
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :number_of_candidates
  validates_presence_of :employment_date
  validates_presence_of :application_cut_off_date
  validates_presence_of :status
  validates_presence_of :daily_rate
  validates_presence_of :requirements
  validates_presence_of :owner
end

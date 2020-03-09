class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  validates_presence_of :description
  validates_presence_of :type
end

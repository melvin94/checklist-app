class Checklist < ApplicationRecord
  has_many :checklist_items, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :description
end

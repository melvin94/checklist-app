class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  validates_presence_of :content
end

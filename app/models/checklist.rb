class Checklist < ApplicationRecord
  has_many :checklist_items, dependent: :destroy
end

class ChecklistItemImage < ChecklistItem
  has_one_attached :image

  validates_presence_of :image
end

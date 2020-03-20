class ChecklistItemImage < ChecklistItem
  has_one_attached :image
  validates_presence_of :image, if: :should_validate?

  def should_validate?
    !new_record?
  end
end

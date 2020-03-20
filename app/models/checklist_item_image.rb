class ChecklistItemImage < ChecklistItem
  has_one_attached :image

  validate :not_blank_attachment

  def not_blank_attachment
    if image.blank?
      image.purge # delete the uploaded file
      errors.add(:image, "needs to be selected before upload")
    end
  end
end

class AddCompletedAtChecklistItemsCorrected < ActiveRecord::Migration[6.0]
  def change
    add_column :checklist_items, :completed, :boolean
  end
end
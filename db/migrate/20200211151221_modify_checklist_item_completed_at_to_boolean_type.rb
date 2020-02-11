class ModifyChecklistItemCompletedAtToBooleanType < ActiveRecord::Migration[6.0]
  def change
    remove_column :checklist_items, :completed_at
    add_column :checklist_items, :completed_at, :boolean
  end
end

class ModifyChecklistItemCompletedAtToBooleanType < ActiveRecord::Migration[6.0]
  def change
    change_column :checklist_items, :completed_at, "boolean USING completed_at::boolean"
    rename_column :checklist_items, :completed_at, :completed
  end
end

class CreateChecklistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :checklist_items do |t|
      t.string :content
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

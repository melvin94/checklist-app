class CreateChecklistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :checklist_items do |t|
      t.string :description
      t.string :result
      t.boolean :completed
      t.references :checklist, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end

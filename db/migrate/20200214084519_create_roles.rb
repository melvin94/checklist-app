class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :title
      t.boolean :checklist_user
      t.boolean :checklist_manager
      t.boolean :user_manager
      t.boolean :organization_manager
      t.boolean :audit_manager
      t.boolean :audit_user
      t.boolean :primary
      t.boolean :admin

      t.timestamps
    end
  end
end

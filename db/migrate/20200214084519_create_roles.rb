class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :description
      t.boolean :basic
      t.boolean :admin
      t.boolean :super_admin

      t.timestamps
    end
  end
end

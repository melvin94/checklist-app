class CreateAccessLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :access_levels do |t|
      t.integer :level
      t.string :title

      t.timestamps
    end
  end
end

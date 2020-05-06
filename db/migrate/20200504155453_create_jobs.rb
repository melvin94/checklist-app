class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.text :description
      t.string :status
      t.integer :created_by

      t.timestamps
    end
  end
end

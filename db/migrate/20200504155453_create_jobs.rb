class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.text :description
      t.text :location
      t.integer :number_of_candidates
      t.datetime :employment_date
      t.datetime :application_cut_off_date
      t.string :status
      t.decimal :daily_rate
      t.text :requirements
      t.integer :owner

      t.timestamps
    end
  end
end

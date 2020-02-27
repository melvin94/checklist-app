class AddAccessLevelToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :access_level, index: true, foreign_key: true
  end
end

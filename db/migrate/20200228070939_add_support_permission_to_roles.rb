class AddSupportPermissionToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :support, :boolean
  end
end

class AddIsAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :Boolean
  end
end

class AddAdminProfileToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin_profile, :boolean, default: false
  end
end

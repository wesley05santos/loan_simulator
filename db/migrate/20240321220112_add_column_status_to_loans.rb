class AddColumnStatusToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :status, :string, null: false, default: ""
  end
end

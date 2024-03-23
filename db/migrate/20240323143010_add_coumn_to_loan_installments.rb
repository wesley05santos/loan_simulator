class AddCoumnToLoanInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :loan_installments, :due_date, :datetime, null: false
  end
end

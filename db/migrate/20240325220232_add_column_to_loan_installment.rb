class AddColumnToLoanInstallment < ActiveRecord::Migration[7.1]
  def change
    add_column :loan_installments, :date_of_payment, :datetime
  end
end

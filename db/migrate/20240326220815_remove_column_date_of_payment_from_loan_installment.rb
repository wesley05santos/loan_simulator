class RemoveColumnDateOfPaymentFromLoanInstallment < ActiveRecord::Migration[7.1]
  def change
    remove_column :loan_installments, :date_of_payment, :datetime
  end
end

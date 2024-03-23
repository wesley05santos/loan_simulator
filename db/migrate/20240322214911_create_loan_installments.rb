class CreateLoanInstallments < ActiveRecord::Migration[7.1]
  def change
    create_table :loan_installments do |t|
      t.references :loan, null: false, foreign_key: true
      t.integer :number_of_installment, null: false
      t.decimal :value_installment, null: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end

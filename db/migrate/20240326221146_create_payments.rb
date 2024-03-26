class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :loan, null: false, foreign_key: true
      t.references :loan_installment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date_of_payment, null: false

      t.timestamps
    end
  end
end

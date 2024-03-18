class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :requested_amount
      t.integer :qtd_payments
      t.decimal :interest_rate
      t.decimal :installment_value

      t.timestamps
    end
  end
end

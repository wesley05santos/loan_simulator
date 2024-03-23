class Loan < ApplicationRecord
  belongs_to :user
  has_many :loan_installment

  validates :requested_amount, presence: true
  validates :qtd_payments, presence: true
  validates :interest_rate, presence: true
  validates :installment_value, presence: true
end

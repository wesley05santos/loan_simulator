class LoanInstallment < ApplicationRecord
  belongs_to :loan
  has_one :payment
end

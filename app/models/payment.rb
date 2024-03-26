class Payment < ApplicationRecord
  belongs_to :loan
  belongs_to :loan_installment
  belongs_to :user
end

class Loans::GenerateAllLoanInstallmentsService < ApplicationService
  def initialize(*args, **kwargs)
    @loan = Loan.find(kwargs[:loan_id])
  end

  private

  def run
    LoanInstallment.create(hash_data)
  end

  def hash_data
    actual_date = Time.zone.today
    hash_data = []
    (1..@loan.qtd_payments).each do |item|
      temp_hash_data = {
        loan_id: @loan.id,
        number_of_installment: item,
        value_installment: @loan.installment_value,
        due_date: actual_date + 30
      }
      hash_data << temp_hash_data
      actual_date += 30
    end
    hash_data
  end
end

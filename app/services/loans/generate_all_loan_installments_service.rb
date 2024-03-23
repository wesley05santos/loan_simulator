class Loans::GenerateAllLoanInstallmentsService < ApplicationService
  def initialize(*args, **kwargs)
    @loan = Loan.find(kwargs[:loan_id])
  end

  private

  def run
    binding.break
    (1..@loan.qtd_payments).each do |item|
      @loan_installment = LoanInstallment.new(
        loan_id: @loan.id,
        number_of_installment: item,
        value_installment: @loan.installment_value
      )
    end
  end
end

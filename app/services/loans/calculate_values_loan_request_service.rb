class Loans::CalculateValuesLoanRequestService < ApplicationService
  def initialize(*args, **kwargs)
    @user = User.find(kwargs[:user_id])
    @args = kwargs.tap { |hash| hash.delete(:user_id) }
  end

  private

  def run
    @loan = @user.loans.new(@args)
    return @loan if @args.values.any?(&:blank?) && !@loan.valid?

    calculate_installment_value
    @loan.save
    @loan
  end

  def calculate_total_interest_percentage
    @loan.qtd_payments * @loan.interest_rate
  end

  def calculate_final_value_loan
    @loan.requested_amount + (@loan.requested_amount * calculate_total_interest_percentage / 100)
  end

  def calculate_installment_value
    @loan.installment_value = calculate_final_value_loan.to_f / @loan.qtd_payments
  end
end

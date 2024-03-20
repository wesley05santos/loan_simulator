class Loans::CalculateValuesLoanRequestService
  def initialize(**args)
    @user = User.find(args[:user_id])
    @args = args.tap { |hash| hash.delete(:user_id) }
  end

  def self.call(args)
    Loans::CalculateValuesLoanRequestService.new(**args).call
  end

  def call
    run
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

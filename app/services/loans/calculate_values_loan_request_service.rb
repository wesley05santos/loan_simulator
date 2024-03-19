class Loans::CalculateValuesLoanRequestService
  def initialize(**args)
    @args = args
  end

  def self.call(args)
    Loans::CalculateValuesLoanRequestService.new(**args).call
  end

  def call
    run
  end

  private

  def run
    @loan = Loan.new(@args)
  end
end

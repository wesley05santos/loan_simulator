class Loans::GenerateLoanSimulationJob < ApplicationJob
  queue_as :default

  def perform(**args)
    Loans::CalculateValuesLoanRequestService.call(**args)
  end
end

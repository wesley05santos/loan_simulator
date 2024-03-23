class Loans::GenerateLoanInstallmentsJob < ApplicationJob
  queue_as :default

  def perform(*args, **kwargs)
    Loans::GenerateAllLoanInstallmentsService.call(*args, **kwargs)
  end
end

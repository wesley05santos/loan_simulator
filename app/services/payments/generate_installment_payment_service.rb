class Payments::GenerateInstallmentPaymentService < ApplicationService
  def initialize(*args, **kwargs)
    @user_id = kwargs[:user_id]
    @installment = LoanInstallment.find(kwargs[:installment_id])
  end

  private

  def run
    Payment.create(hash_data)
  end

  def hash_data
    Time.zone = 'America/Sao_Paulo'
    @hash_data = {
      loan_id: @installment.loan_id,
      loan_installment_id: @installment.id,
      user_id: @user_id,
      date_of_payment: Time.zone.now
    }
  end
end

class PaymentsController < ApplicationController
  def new
    @installment_id = params[:installment_id]
    @payment = Payment.new
  end

  def create
    @loan_installment = LoanInstallment.find(params[:installment_id])
    return redirect_to loan_path(@loan_installment.loan) if @loan_installment.payment.present?

    @payment = Payments::GenerateInstallmentPaymentService.call(user_id: current_user.id, installment_id: params[:installment_id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: (@loan_installment.value_installment * 100).to_i,
      description: 'Batata',
      currency: 'brl'
    })
    redirect_to loan_path(@loan_installment.loan) if @loan_installment.update(paid: charge[:paid])

    rescue Stripe::CardError => e
      @payment.destroy
      flash[:error] = e.message
      redirect_to new_payment_path
  end
end

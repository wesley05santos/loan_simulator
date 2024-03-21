class LoansRequestsController < ApplicationController
  before_action :set_loan, only: %i[ approve_loan reject_loan ]
  before_action :authorized_user

  def index
    @loans = Loan.all
  end

  def approve_loan
    @loan.update(status: 'approved')
    redirect_to loans_requests_path
  end

  def reject_loan
    @loan.update(status: 'rejected')
    redirect_to loans_requests_path
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end
end

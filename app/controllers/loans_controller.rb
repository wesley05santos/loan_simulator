class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[ show edit update destroy ]

  def index
    @loans = current_user.loans.order(id: :desc)
  end

  def show; end

  def new
    @loan = Loan.new
  end

  def edit; end

  def create
    @loan = Loan.new(loan_params)
    @loan.valid?
    return render :new if loan_params.values.any?(&:blank?)

    Loans::GenerateLoanSimulationJob.perform_later(user_id: current_user.id, **loan_params)
    redirect_to loans_path
  end

  def update
    return redirect_to @loan if @loan.update(loan_params)

    render :edit
  end

  def destroy
    @loan.destroy!
    flash[:notice] = 'Solicitação Deletada com Sucesso!' if @loan.destroy
    redirect_to loans_path
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:requested_amount, :qtd_payments, :interest_rate)
  end
end

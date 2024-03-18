class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]
  before_create :actual_current_user, only: %i[ create update ]

  def index
    @loans = Loan.all
  end

  def show; end

  def new
    @loan = Loan.new
  end

  def edit; end

  def create
    @loan = Loan.new(loan_params)
    return redirect_to @loan if @loan.save

    render :show
  end

  def update
    return redirect_to @loan if @loan.update(loan_params)

    render :edit
  end

  def destroy
    @loan.destroy!
    flash[:notice] = 'Produto Deletado com Sucesso!' if @loan.destroy
    redirect_to products_path
  end

  private
    def actual_current_user
      @loan.user_id = current_user.id
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:requested_amount, :qtd_payments, :interest_rate)
    end
end

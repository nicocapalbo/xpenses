class AccountsController < ApplicationController
  before_action :set_ledger, only: [:index, :create]
  def index
    @accounts = Account.where(ledger: @ledger)
    @account = Account.new
    console
  end

  def create
    @account = Account.new(account_params)
    @account.ledger = @ledger
    if @account.save
      redirect_to ledger_path(@ledger)
    else
      render :index
    end
  end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end

  def account_params
    params.require(:account).permit(:name)
  end
end

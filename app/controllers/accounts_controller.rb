class AccountsController < ApplicationController
  before_action :set_ledger, only: [:index, :create]
  def index
    @accounts = Account.find(@ledger.id)
    @account = Account.new
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

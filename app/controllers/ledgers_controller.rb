class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.all
  end

  def show
    @ledger = Ledger.find(params[:id])
  end

  def new
    @ledger = Ledger.new
  end

  def create
    @ledger = Ledger.new(ledger_params)
    @ledger.user = current_user
    if @ledger.save!
      redirect_to ledger_path(@ledger)
    else
      render :new
    end
  end

  private

  def ledger_params
    params.require(:ledger).permit(:name, :description)
  end
end

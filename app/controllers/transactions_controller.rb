class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    @ledger = params[:transaction][:ledger_id].to_i
    if @transaction.save!
      redirect_to ledger_path(@ledger)
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:ledger_id, :account_id, :date, :info, :subcategory_id, :cleared, :payment, :deposit)
  end
end

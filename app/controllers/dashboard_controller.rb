class DashboardController < ApplicationController
  before_action :set_ledger, only: [:index, :create]

  def index
    @accounts = Account.where(ledger: @ledger)
    @categories = categories_total
    @month_total_expense = month_total_expense
    @top_transactions = top_transactions
  end

  private

  def month_total_expense
    Category.month_total_expense
  end

  def top_transactions
    Transaction.month_top_transactions
  end

  def categories_total
    categories = []
    Category.all.each do |category|
      categories << {
        category_name: category.name,
        category_total: category.category_total
      }
    end
    categories
  end

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end
end

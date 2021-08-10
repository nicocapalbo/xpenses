class DashboardController < ApplicationController
  before_action :set_ledger, only: [:index, :create]

  def index
    @accounts = Account.where(ledger: @ledger)
    @categories = []
    Category.all.each do |category|
      @categories << {
        category_name: category.name,
        category_total: category.category_total
      }
    end
  end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end
end

class DashboardController < ApplicationController
  before_action :set_ledger, only: [:index, :create]

  def index
    @accounts = Account.where(ledger: @ledger)
    @categories = categories_total
    @month_total = month_total
  end

  private

  def month_total
    month_total = 0
    Category.all.each { |category| month_total += category.category_total }
    month_total
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

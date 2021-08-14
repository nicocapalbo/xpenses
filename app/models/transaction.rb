class Transaction < ApplicationRecord
  belongs_to :ledger
  belongs_to :account
  belongs_to :subcategory

  def self.month_top_transactions
    Transaction.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).order(payment: :asc).first(5)
  end
end

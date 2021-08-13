class Ledger < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :categories
  has_many :subcategories, through: :categories
  has_many :transactions

  def networth_cleared
    self.transactions.where(cleared: true).sum(:deposit) - self.transactions.where(cleared: true).sum(:payment)
  end

  def networth_balance
    self.transactions.sum(:deposit) - self.transactions.sum(:payment)
  end

end

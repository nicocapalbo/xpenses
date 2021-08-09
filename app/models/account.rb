class Account < ApplicationRecord
  belongs_to :ledger
  has_many :transactions

  def cleared_account
    payment_totals = self.ledger.transactions.where(account: self).sum(:payment)
    deposit_totals = self.ledger.transactions.where(account: self).sum(:deposit)
    (deposit_totals - payment_totals)
  end

  def balanced_account
    payment_totals = self.ledger.transactions.where(account: self, cleared: true).sum(:payment)
    deposit_totals = self.ledger.transactions.where(account: self, cleared: true).sum(:deposit)
    (deposit_totals - payment_totals)
  end
end

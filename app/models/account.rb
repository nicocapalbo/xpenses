class Account < ApplicationRecord
  belongs_to :ledger
  has_many :transactions

  def net_account
    payment_totals = self.ledger.transactions.where(account: self, cleared: true).sum(:payment)
    deposit_totals = self.ledger.transactions.where(account: self, cleared: true).sum(:deposit)
    (deposit_totals - payment_totals)
  end
end

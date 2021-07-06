class Account < ApplicationRecord
  belongs_to :ledger
  has_many :transactions
end

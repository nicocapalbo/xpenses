class Ledger < ApplicationRecord
  belongs_to :user
  has_many :accounts, :categories, :transactions
end

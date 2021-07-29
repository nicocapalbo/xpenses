class Ledger < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :categories
  has_many :transactions
end

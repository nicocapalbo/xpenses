class Transaction < ApplicationRecord
  belongs_to :ledger
  belongs_to :account
  belongs_to :subcategory
end

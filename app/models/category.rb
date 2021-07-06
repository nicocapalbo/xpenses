class Category < ApplicationRecord
  belongs_to :ledger
  has_many :subcategories
  has_many :transactions, through: :subcategories
end

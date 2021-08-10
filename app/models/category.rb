class Category < ApplicationRecord
  belongs_to :ledger
  has_many :subcategories
  has_many :transactions, through: :subcategories

  def category_total
    Subcategory.where(category: self).joins(:transactions).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:payment)
  end
end

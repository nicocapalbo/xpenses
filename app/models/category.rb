class Category < ApplicationRecord
  include Abyme::Model

  belongs_to :ledger
  has_many :subcategories
  abymize :subcategories, permit: [:name]
  has_many :transactions, through: :subcategories
  
  validates :ledger, :name, presence: true
  validates :name, length: { in: 4..20 }

  def category_total
    Subcategory.where(category: self).left_outer_joins(:transactions).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:payment)
  end

  # def category_total_income
  #   Category.joins(subcategories: :transactions).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:deposit)
  # end

  def self.month_total_expense
    Category.joins(subcategories: :transactions).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:payment)
  end
end

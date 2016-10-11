class ExchangeRate < ApplicationRecord
  validates :date, :rate, presence: true
  validates :date, uniqueness: true
  validates :rate, numericality: { only_float: true }
end

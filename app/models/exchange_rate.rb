class ExchangeRate < ApplicationRecord
  validates :date, :rate, presence: true
  validates :rate, numericality: { only_float: true }
end

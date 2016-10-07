module Calculator
  def self.calculate_eur(amount, exch_rate)
    amount = amount.to_i
    ratio = exch_rate.rate
    amount * ratio
  end
end

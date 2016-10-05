class AddIndexToExchangeRates < ActiveRecord::Migration[5.0]
  def change
    add_index :exchange_rates, :date
    add_index :exchange_rates, :rate
  end
end

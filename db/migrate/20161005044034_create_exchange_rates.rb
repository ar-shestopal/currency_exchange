class CreateExchangeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rates do |t|
      t.datetime :date
      t.float :rate

      t.timestamps
    end
  end
end

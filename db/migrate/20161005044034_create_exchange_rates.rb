class CreateExchangeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rates do |t|
      t.string :date
      t.float :rate

      t.timestamps
    end
  end
end

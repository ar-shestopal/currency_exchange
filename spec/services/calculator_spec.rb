require 'rails_helper'

RSpec.describe Calculator, type: :model do
  describe '#calculate_eur' do
    let!(:date) { Date.today }
    let!(:rate) { 2.0 }
    let!(:exchange_rate) { FactoryGirl.create(:exchange_rate, date: date, rate: rate) }

    it 'should find exchange rate by year, month, day' do
      expect(Calculator.calculate_eur(120, exchange_rate)).to eq 240
    end
  end
end

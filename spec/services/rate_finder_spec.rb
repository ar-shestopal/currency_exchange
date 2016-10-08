require 'rails_helper'

RSpec.describe RateFinder, type: :model do
  describe '#find' do
    let!(:date) { Date.today }
    let!(:exchange_rate) { FactoryGirl.create(:exchange_rate, date: date) }

    it 'should find exchange rate by year, month, day' do
      date_params = { year: date.year, month: date.month, day: date.day }

      expect(RateFinder.find(date_params)).to eq exchange_rate
    end
  end
end

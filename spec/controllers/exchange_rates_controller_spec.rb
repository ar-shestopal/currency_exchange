require 'rails_helper'

RSpec.describe ExchangeRatesController, type: :controller do
  before(:each) do
    FactoryGirl.create(:exchange_rate, date: Date.yesterday )
  end

  describe 'GET #index' do
   it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #calculate' do
    let!(:date) { Date.today }

    context '#render' do
      it 'renders index template' do
        get :calculate, date: { year: date.year,
                                month: date.month,
                                day: date.day }, amount: 100

        expect(response).to render_template('index')
      end
    end

    context '#with exchange rate' do
      let!(:date) { Date.today }
      let!(:rate) { 2.0 }
      let!(:exchange_rate) { FactoryGirl.create(:exchange_rate, date: date,
                                                                rate: rate) }

      it 'calculates amount in euro by date' do
        get :calculate, date: { year: date.year,
                                month: date.month,
                                day: date.day }, amount: 100

        expect(assigns(:eur)).to eq 200
      end
    end

    context '#exchange rate not found' do
      it 'calculates amount in euro by date' do
        get :calculate, date: { year: date.year,
                                month: date.month,
                                day: date.day }, amount: 100

        expect(flash[:error]).to eq 'No exchange rate found for a given date'
      end
    end
  end
end

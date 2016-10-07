class ExchangeRatesController < ApplicationController

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all
  end

  # GET /exchange_rates/calculate
  def calculate
    amount = params[:amount]
    exchange_rate = RateFinder.find(params[:date])
    @eur = Calculator.calculate_eur(amount, exchange_rate)
    render 'index'
  end
end

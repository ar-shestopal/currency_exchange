class ExchangeRatesController < ApplicationController
  before_filter :set_latest_rate

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all
  end

  # GET /exchange_rates/calculate
  def calculate
    exchange_rate = RateFinder.find(params[:date])

    if exchange_rate
      @eur = Calculator.calculate_eur(params[:amount], exchange_rate)
      render 'index'
    else
      flash.now[:error] = "No exchange rate found for a given date"
      render 'index'
    end
  end

  private

  # Somehow rspec views spec sees ExchangeRate.first.date as string and trow an
  # error, meanwhile on the view this date is a date object
  def set_latest_rate
    @latest_rate = Date.parse(ExchangeRate.first.date.to_s)
  end
end

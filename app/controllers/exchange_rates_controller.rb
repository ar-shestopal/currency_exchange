class ExchangeRatesController < ApplicationController

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all
  end

  private

    def exchange_rate_params
      params.require(:exchange_rate).permit(:date, :rate)
    end
end

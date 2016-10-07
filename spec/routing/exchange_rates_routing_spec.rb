require "rails_helper"

RSpec.describe ExchangeRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/exchange_rates").to route_to("exchange_rates#index")
    end

    it "routes to #calculate" do
      expect(post: "/exchange_rates/calculate")
        .to route_to("exchange_rates#calculate")
    end
  end
end

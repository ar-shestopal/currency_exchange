require 'rails_helper'

RSpec.describe ExchangeRatesController, type: :controller do
  describe "GET #index" do
   it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #calculate" do
    it "finds ExchangeRage by date" do
      pending 'Not implemented'
      fail
    end
  end
end

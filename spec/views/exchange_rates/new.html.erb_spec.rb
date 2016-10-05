require 'rails_helper'

RSpec.describe "exchange_rates/new", type: :view do
  before(:each) do
    assign(:exchange_rate, ExchangeRate.new(
      :rate => 1.5
    ))
  end

  it "renders new exchange_rate form" do
    render

    assert_select "form[action=?][method=?]", exchange_rates_path, "post" do

      assert_select "input#exchange_rate_rate[name=?]", "exchange_rate[rate]"
    end
  end
end

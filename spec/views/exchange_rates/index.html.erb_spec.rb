require 'rails_helper'

RSpec.describe "exchange_rates/index", type: :view do
  before(:each) do
    assign(:exchange_rates, [
      ExchangeRate.create!(
        :rate => 2.5
      ),
      ExchangeRate.create!(
        :rate => 2.5
      )
    ])
  end

  it "renders a list of exchange_rates" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "exchange_rates/edit", type: :view do
  before(:each) do
    @exchange_rate = assign(:exchange_rate, ExchangeRate.create!(
      :rate => 1.5
    ))
  end

  it "renders the edit exchange_rate form" do
    render

    assert_select "form[action=?][method=?]", exchange_rate_path(@exchange_rate), "post" do

      assert_select "input#exchange_rate_rate[name=?]", "exchange_rate[rate]"
    end
  end
end

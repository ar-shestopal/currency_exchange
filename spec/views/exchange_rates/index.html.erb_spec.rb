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

  it "renders a form" do
    render

    expect(rendered).to have_selector('form')
  end
end

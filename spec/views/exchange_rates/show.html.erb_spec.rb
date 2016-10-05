require 'rails_helper'

RSpec.describe "exchange_rates/show", type: :view do
  before(:each) do
    @exchange_rate = assign(:exchange_rate, ExchangeRate.create!(
      :rate => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
  end
end

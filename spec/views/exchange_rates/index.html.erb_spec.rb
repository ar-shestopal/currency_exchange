require 'rails_helper'

RSpec.describe 'exchange_rates/index', type: :view do
  before(:each) do
    FactoryGirl.create(:exchange_rate, date: Date.today)
  end

  it 'renders a form' do
    render

    expect(rendered).to have_selector('form')
  end
end

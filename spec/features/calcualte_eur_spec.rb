require 'rails_helper'

RSpec.feature('Can convert USD to EUR for a given date') do
  before(:each) do
    @date = Date.today
    @rate = 2.0
    @amount = 200
    FactoryGirl.create(:exchange_rate, date: @date, rate: @rate)
  end

  scenario('Amount of USD given') do
    visit root_path
    select @date.year.to_s, from: 'date_year'
    # select @date.month.to_s, from: 'date_month'
    select Date::MONTHNAMES[@date.month], from: 'date_month'
    select @date.day.to_s, from: 'date_day'

    fill_in 'Amount', with: 200

    click_button "Calculate"
    # find('input[name="commit"]').click
    expect(page).to have_content 'Calcualted amount in EUR 400.0'
  end
end
require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:rate) }
  it { should validate_numericality_of(:rate) }
end

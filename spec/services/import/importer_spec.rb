require 'rails_helper'

RSpec.describe Import::Importer, type: :model do
  describe '#import' do

    let(:data) {
                  ['(2015-10-20, 1.0887, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)',
                   '(2015-10-19, 1.0926, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)',
                   '(2015-10-18, 1.0926, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)',
                   '(2015-10-17, 1.0926, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)']
               }
    it 'add new exchange rates' do
      expect{Import::Importer.import(data)}.to change{ExchangeRate.count}.by 4
    end

    it 'prints error message' do
      expect(STDOUT).to receive(:puts).with('Empty dataset - []')
      Import::Importer.import([])
    end
  end
end

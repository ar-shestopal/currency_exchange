require 'rails_helper'
require 'csv'

RSpec.describe Import::CsvParser, type: :model do
  describe '#parse' do
    let(:headers) { "Data Source in SDW, \r\n" }
    let(:rows)    { ["Collection:,Average of observations through period\r\n2015-10-20,1.0887\r\n2015-10-19,1.0926"] }
    let(:io) do
      StringIO.new.tap do |sio|
        sio << headers
        rows.each { |row| sio << row }
        sio.rewind
      end
    end

    it 'should return data to import' do
      expect(File).to receive(:open).with('filename', {:universal_newline=>false}) { io }
      result = Import::CsvParser.new('filename').parse
      expect(result).to eq ["('2015-10-20', '1.0887')",
                            "('2015-10-19', '1.0926')",
                            "('2015-10-18', '1.0926')",
                            "('2015-10-17', '1.0926')"]
    end
  end
end

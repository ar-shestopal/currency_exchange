require 'rails_helper'
require 'csv'

RSpec.describe Parser::Csv, type: :model do
  describe "read csv" do
    let(:headers) { "Data Source in SDW, \r\n" }
    let(:rows)    { ["Collection:,Average of observations through period\r\n2015-12-31,1.0887\r\n2015-12-30,1.0926"] }
    let(:io) do
      StringIO.new.tap do |sio|
        sio << headers
        rows.each { |row| sio << row }
        sio.rewind
      end
    end

    it "should read csv file" do
      expect(File).to receive(:open).with("filename", {:universal_newline=>false}) { io }
      CSV.foreach('filename') do |row|
        puts row.inspect
      end
      expect(true).to be_falsy
    end
  end
end

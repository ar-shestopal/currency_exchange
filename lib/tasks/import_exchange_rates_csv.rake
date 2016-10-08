require 'csv'

namespace :db do
  desc "Import exchange rates form csv file"
  task :import_rates_csv, [:filename] => [:environment] do |_, args|
    file = args[:filename]
    fail "File #{file} not found" unless File.exist?(file)

    data = Import::CsvParser.new(file).parse
    Import::Importer.import(data)
  end
end

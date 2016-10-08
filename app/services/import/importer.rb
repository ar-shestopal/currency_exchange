module Import
  module Importer
    def self.import(data)
      if data.empty?
        puts "Empty dataset - #{data.inspect}"
        return
      end
      sql = "INSERT INTO exchange_rates (date, rate, created_at, updated_at)"\
            " VALUES #{data.join(',')};"

      begin
        ActiveRecord::Base.connection.execute(sql)
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
    end
  end
end

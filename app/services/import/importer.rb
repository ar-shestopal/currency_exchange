module Import
  module Importer
    def self.import(data)
      if data.empty?
        puts "Empty dataset - #{data.inspect}"
        return
      end

      sql = <<-SQL
        BEGIN;

        CREATE TEMPORARY TABLE newvals(new_date date, rate double precision)
        ON COMMIT DROP;

        INSERT INTO newvals(new_date, rate) VALUES #{data.join(',')};

        LOCK TABLE exchange_rates IN EXCLUSIVE MODE;

        UPDATE exchange_rates
        SET date = newvals.new_date,
            rate = newvals.rate,
            created_at = CURRENT_TIMESTAMP::timestamp without time zone,
            updated_at = CURRENT_TIMESTAMP::timestamp without time zone
        FROM newvals
        WHERE newvals.new_date::date = exchange_rates.date::date;

        INSERT INTO exchange_rates
          (
              date,
              rate,
              created_at,
              updated_at
          )
        SELECT newvals.new_date,
               newvals.rate,
               CURRENT_TIMESTAMP::timestamp without time zone,
               CURRENT_TIMESTAMP::timestamp without time zone

        FROM newvals
        LEFT OUTER JOIN exchange_rates
        ON (exchange_rates.date::date = newvals.new_date::date)
        WHERE exchange_rates.date IS NULL;

        COMMIT;
      SQL

      begin
        ActiveRecord::Base.connection.execute(sql)
      rescue Exception => e
        puts "ERROR: #{e.message} with backtrace #{e.backtrace}"
      end
    end
  end
end



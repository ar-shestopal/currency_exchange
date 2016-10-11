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
        puts "ERROR: #{e.message} with backtrace #{e.backtrace}"
      end
    end
  end
end


sql = <<-SQL
      BEGIN;

      CREATE TEMPORARY TABLE  newvals(date date,
                              rate double precision,
                              created_at timestamp without time zone,
                              updated_at timestamp without time zone)
      ON COMMIT
      DROP;

      INSERT INTO newvals(date, rate, created_at, updated_at) VALUES #{data};

      LOCK TABLE clients IN EXCLUSIVE MODE;

      UPDATE exchange_rates
      SET date = newvals.date,
          created_at = CURRENT_TIMESTAMP::timestamp without time zone,
          updated_at = CURRENT_TIMESTAMP::timestamp without time zone,
      FROM newvals
      WHERE newvals.id = clients.id;

      INSERT INTO clients
        (
          id,
          abbreviation,
          name,
          created_at,
          updated_at,
          contact_email,
          contact_phone,
          scoring_contact_name,
          general_notes,
          deleted_at
        )
      SELECT newvals.id,
             newvals.abbreviation,
             newvals.name,
             newvals.created_at,
             newvals.updated_at,
             newvals.contact_email,
             newvals.contact_phone,
             newvals.scoring_contact_name,
             newvals.general_notes,
             newvals.deleted_at
      FROM newvals
      LEFT OUTER JOIN clients ON (clients.id = newvals.id)
      WHERE clients.id IS NULL;

      COMMIT;
SQL
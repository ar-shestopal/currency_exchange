module Import
  class CsvParser
    def initialize(filename)
      @file = filename
      @result = []
    end

    def parse
      CSV.foreach(@file) do |row|
        date_str = row[0]
        rate_str = row[1]
        next unless date?(date_str)
        next unless rate?(rate_str)
        add(date_str, rate_str)
      end
      @result
    end

    private

    def add(date_str, rate_str)
      date = Date.parse(date_str)
      unless next_holiday?(date)
        write_to_result(date, rate_str)
      else
        write_to_result(date, rate_str)
        write_holidays_to_result(date, rate_str)
      end
    end

    def next_holiday?(date)
      date.cwday == 1
    end

    def write_to_result(date, rate_str)
      @result << "('#{date}', '#{rate_str}')"
    end

    def write_holidays_to_result(date, rate_str)
      2.times do
        date = date.prev_day
        write_to_result(date, rate_str)
      end
    end

    def date?(date_str)
      return true if Date.parse(date_str)
    rescue => err
      false
    end

    def rate?(rate_str)
      /^\d+\.\d+$/ =~ rate_str ? true : false
    end
  end
end

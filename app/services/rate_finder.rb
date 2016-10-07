module RateFinder
  def self.find(date_params)
    year = date_params[:year].to_i
    month = date_params[:month].to_i
    day = date_params[:day].to_i

    binding.pry
    date = Date.new(year, month, day)

    ExchangeRate.find_by_date(date)
  end
end

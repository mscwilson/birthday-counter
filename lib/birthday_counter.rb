require "date"

class BirthdayCounter

  attr_reader :birthdate

  def initialize(day, month)
    @birthdate = Date.new(Date.today.year, month.to_i, day.to_i)

  end

  def today?
    now = Date.today
    (@birthdate.day == now.day) && (@birthdate.month == now.month) 
  end

  def days_until
    days = (@birthdate - Date.today).to_i
    if days >= 0
      days
    else
      365 + days
    end
  end

end

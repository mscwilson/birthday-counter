require "date"

class BirthdayCounter
  NOT_MANY_DAYS_TO_HAVE_TO_WAIT = 40

  attr_reader :birthdate

  def initialize(day, month)
    @today = Date.new(2021, 3, 5)
    @birthdate = Date.new(Date.today.year, month.to_i, day.to_i)
  end

  def today?
    now = Date.today
    (birthdate.day == now.day) && (birthdate.month == now.month) 
  end

  def days_until(added_year = 0)
    days = (birthdate.next_year(added_year) - Date.today).to_i
    days >= 0 ? days : days_until(1)
  end

  def opening_message
    return "Happy birthday" if today?
    days_until < NOT_MANY_DAYS_TO_HAVE_TO_WAIT ? "Good news" : "Bad news"
  end

  def closing_message
    return "Have a lovely day" if today?
    "Your birthday is in #{days_until} days"
  end
end

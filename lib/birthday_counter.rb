class BirthdayCounter

  attr_reader :birthdate

  def initialize(day, month)
    @birthdate = Time.new(2000, month.to_i, day.to_i)

  end

end

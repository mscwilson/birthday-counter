class BirthdayCounter

  attr_reader :birthdate

  def initialize(year, month, day)
    @birthdate = Time.new(year.to_i, month.to_i, day.to_i)

  end

end

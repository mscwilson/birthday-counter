require "date"
require "birthday_counter"

describe BirthdayCounter do 

  it "turns form info into a Date" do
    birthday = BirthdayCounter.new("4", "5")
    expect(birthday.birthdate.day).to eq 4
  end

  it "knows if birthday is today" do
    now = Date.today
    birthday = BirthdayCounter.new(now.day, now.month)
    expect(birthday).to be_today
  end

  it "also knows if birthday is not today" do
    now = Date.today
    birthday = BirthdayCounter.new(now.day + 1, now.month)
    expect(birthday).not_to be_today
  end

  it "calculates days until nearby birthday" do
    allow(Date).to receive(:today).and_return(Date.new(2021, 7, 1))
    birthday = BirthdayCounter.new("5", "7")
    expect(birthday.days_until).to eq 4
  end

  it "calculates day until faraway birthday" do
    allow(Date).to receive(:today).and_return(Date.new(2021, 7, 1))
    birthday = BirthdayCounter.new("1", "6")
    expect(birthday.days_until).to eq 335
  end

end

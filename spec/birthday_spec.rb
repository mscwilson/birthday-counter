require "birthday_counter"

describe BirthdayCounter do 

  it "turns form info into a Date" do
    birthday = BirthdayCounter.new("4", "5")
    expect(birthday.birthdate.day).to eq 4
  end

  it "checks if birthday is today"


end

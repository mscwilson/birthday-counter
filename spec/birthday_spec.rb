require "birthday_counter"

describe BirthdayCounter do 

  it "turns form info into a Date" do
    birthday = BirthdayCounter.new("2011", "5", "4")
    expect(birthday.birthdate.day).to eq 4
  end



end

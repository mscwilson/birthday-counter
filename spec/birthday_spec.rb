require "date"
require "birthday_counter"

describe BirthdayCounter do 

  it "turns form info into a Date" do
    birthday = BirthdayCounter.new("4", "5")
    expect(birthday.birthdate.day).to eq 4
  end

  it "knows if birthday is not today" do
    now = Date.today
    birthday = BirthdayCounter.new(now.day + 1, now.month)
    expect(birthday).not_to be_today
  end

  describe "birthday is today" do
    let(:now) { Date.today }
    let(:birthday) { BirthdayCounter.new(now.day, now.month) }

    it "knows if birthday is today" do
      expect(birthday).to be_today
    end

    it "opening message is happy birthday" do
      expect(birthday.opening_message).to eq "Happy birthday"
    end

    it "doesn't say how many days it is for closing message" do
      expect(birthday.closing_message).to eq "Have a lovely day"
    end
  end

  describe "birthday is soon" do
    before do
      allow(Date).to receive(:today).and_return(Date.new(2021, 7, 1))
      @birthday = BirthdayCounter.new("5", "7")
    end

    it "calculates days until nearby birthday" do
      allow(Date).to receive(:today).and_return(Date.new(2021, 7, 1))
      expect(@birthday.days_until).to eq 4
    end

    it "opening message is good news if the birthday is soon" do
      expect(@birthday.opening_message).to eq "Good news"
    end

    it "tells how many days to wait" do
      expect(@birthday.closing_message).to eq "Your birthday is in 4 days"
    end

  end

  describe "birthday is not for ages" do
    before do
      allow(Date).to receive(:today).and_return(Date.new(2021, 7, 1))
      @birthday = BirthdayCounter.new("1", "6")
    end

    it "calculates day until faraway birthday" do
      expect(@birthday.days_until).to eq 335
    end

    it "opening message is bad news" do
      expect(@birthday.opening_message).to eq "Bad news"
    end

  end


end

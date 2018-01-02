RSpec.describe NaturalTime do
  it "has a version number" do
    expect(NaturalTime::VERSION).not_to be nil
  end

  describe "seconds" do
    it "returns zero seconds" do
      expect(NaturalTime.natural_time(0)).to eq("0 seconds")
    end

    it "returns singular" do
      expect(NaturalTime.natural_time(1)).to eq("1 second")
    end

    it "returns seconds" do
      (2..59).each do |i|
        expect(NaturalTime.natural_time(i)).to eq("#{i} seconds")
      end
    end

    it "does not return 60 seconds" do
      expect(NaturalTime.natural_time(60.seconds)).not_to match(/60 seconds/)
    end

    it "returns remainder in seconds" do
      expect(NaturalTime.natural_time(65.seconds)).to match(/ 5 seconds/)
    end
  end

  describe "minutes" do
    it "returns singular" do
      expect(NaturalTime.natural_time(60.seconds)).to eq "1 minute"
    end

    it "returns whole minutes" do
      (2..59).each do |i|
        expect(NaturalTime.natural_time(i.minutes)).to eq "#{i} minutes"
      end
    end

    it "does not return 60 minutes" do
      expect(NaturalTime.natural_time(60.minutes)).not_to match(/60 minutes/)
    end

    it "returns remainder in seconds" do
      expect(NaturalTime.natural_time(65.seconds)).to eq "1 minute, 5 seconds"
    end
  end

  describe "hours" do
    it "returns singular" do
      expect(NaturalTime.natural_time(1.hour)).to eq "1 hour"
    end

    it "returns whole hours" do
      (2..23).each do |i|
        expect(NaturalTime.natural_time(i.hours)).to eq "#{i} hours"
      end
    end

    it "does not return 24 hours" do
      expect(NaturalTime.natural_time(24.hours)).not_to match(/24 hours/)
    end

    it "returns remainder in minutes" do
      expect(NaturalTime.natural_time(1.hour + 5.minutes)).to eq "1 hour, 5 minutes"
    end

    it "returns remainder in minutes and seconds" do
      expect(NaturalTime.natural_time(1.hour + 5.minutes + 5.seconds)).to eq "1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "days" do
    it "returns singular" do
      expect(NaturalTime.natural_time(1.day)).to eq "1 day"
    end

    it "returns whole days" do
      (2..6).each do |i|
        expect(NaturalTime.natural_time(i.days)).to eq "#{i} days"
      end
    end

    it "does not return 7 days" do
      expect(NaturalTime.natural_time(7.days)).not_to match(/7 days/)
    end

    it "returns remainder in hours" do
      expect(NaturalTime.natural_time(1.day + 1.hour)).to eq "1 day, 1 hour"
    end

    it "returns remainder in hours and minutes" do
      expect(NaturalTime.natural_time(1.day + 1.hour + 5.minutes)).to eq "1 day, 1 hour, 5 minutes"
    end

    it "returns remainder in hours and minutes and seconds" do
      expect(NaturalTime.natural_time(1.day + 1.hour + 5.minutes + 5.seconds)).to eq "1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "weeks" do
    it "returns singular" do
      expect(NaturalTime.natural_time(1.week)).to eq "1 week"
    end

    it "returns whole weeks" do
      (2..4).each do |i|
        expect(NaturalTime.natural_time(i.weeks)).to eq "#{i} weeks"
      end
    end

    it "does not return 5 weeks" do
      expect(NaturalTime.natural_time(5.weeks)).not_to match(/5 weeks/)
    end

    it "returns remainder in days" do
      expect(NaturalTime.natural_time(1.week + 1.day)).to eq "1 week, 1 day"
    end

    it "returns remainder in days and hours" do
      expect(NaturalTime.natural_time(1.week + 1.day + 1.hour)).to eq "1 week, 1 day, 1 hour"
    end

    it "returns remainder in days and hours and minutes" do
      expect(NaturalTime.natural_time(1.week + 1.day + 1.hour + 5.minutes)).to eq "1 week, 1 day, 1 hour, 5 minutes"
    end

    it "returns remainder in days and hours and minutes and seconds" do
      expect(NaturalTime.natural_time(1.week + 1.day + 1.hour + 5.minutes + 5.seconds)).to eq "1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "months" do
    it "returns singular" do
      expect(NaturalTime.natural_time(1.month)).to eq "1 month"
    end

    it "returns whole months" do
      (2..4).each do |i|
        expect(NaturalTime.natural_time(i.months)).to eq "#{i} months"
      end
    end

    it "does not return 12 months" do
      expect(NaturalTime.natural_time(13.months)).not_to match(/13 months/)
    end

    it "returns remainder in weeks" do
      expect(NaturalTime.natural_time(1.month + 1.week)).to eq "1 month, 1 week"
    end

    it "returns remainder in days" do
      expect(NaturalTime.natural_time(1.month + 1.week + 1.day)).to eq "1 month, 1 week, 1 day"
    end

    it "returns remainder in days and hours" do
      expect(NaturalTime.natural_time(1.month + 1.week + 1.day + 1.hour)).to eq "1 month, 1 week, 1 day, 1 hour"
    end

    it "returns remainder in days and hours and minutes" do
      expect(NaturalTime.natural_time(1.month + 1.week + 1.day + 1.hour + 5.minutes)).to eq "1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end

    it "returns remainder in days and hours and minutes and seconds" do
      expect(NaturalTime.natural_time(1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds)).to eq "1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "years" do
    it "returns singular" do
      expect(NaturalTime.natural_time(1.year)).to eq "1 year"
    end

    it "returns whole years" do
      (2..4).each do |i|
        expect(NaturalTime.natural_time(i.years)).to eq "#{i} years"
      end
    end

    it "returns remainder in months" do
      expect(NaturalTime.natural_time(1.year + 1.month)).to eq "1 year, 1 month"
    end

    it "returns remainder in months and weeks" do
      expect(NaturalTime.natural_time(1.year + 1.month + 1.week)).to eq "1 year, 1 month, 1 week"
    end

    it "returns remainder in months and days" do
      expect(NaturalTime.natural_time(1.year + 1.month + 1.week + 1.day)).to eq "1 year, 1 month, 1 week, 1 day"
    end

    it "returns remainder in months and days and hours" do
      expect(NaturalTime.natural_time(1.year + 1.month + 1.week + 1.day + 1.hour)).to eq "1 year, 1 month, 1 week, 1 day, 1 hour"
    end

    it "returns remainder in months and days and hours and minutes" do
      expect(NaturalTime.natural_time(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes)).to eq "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end

    it "returns remainder in months and days and hours and minutes and seconds" do
      expect(NaturalTime.natural_time(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds)).to eq "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end

    describe "precision" do
      it "limit the precision to 1" do
        expect(NaturalTime.natural_time(1.week + 1.minutes + 1.second, :precision => 1)).to eq "1 week"
      end

      it "limit the precision to 2" do
        expect(NaturalTime.natural_time(1.week + 1.minutes + 1.second, :precision => 2)).to eq "1 week, 1 minute"
      end

      it "show the distance with precision of 1 in the past" do
        distance = -1 * (1.week + 1.minutes + 1.second)
        expect(NaturalTime.distance(distance, :precision => 1)).to eq "1 week ago"
      end

      it "show the distance with precision of 2 in the past" do
        distance = -1 * (1.week + 1.minutes + 1.second)
        expect(NaturalTime.distance(distance, :precision => 2)).to eq "1 week and 1 minute ago"
      end

      it "show the distance with precision of 1 in the future" do
        distance = (1.week + 1.minutes + 1.second)
        expect(NaturalTime.distance(distance, :precision => 1)).to eq "1 week from now"
      end

      it "show the distance with precision of 2 in the future" do
        distance = (1.week + 1.minutes + 1.second)
        expect(NaturalTime.distance(distance, :precision => 2)).to eq "1 week and 1 minute from now"
      end
    end

    describe "distances" do
      it "give the distance in the past" do
        expect(NaturalTime.distance(-1)).to eq "1 second ago"
      end

      it "give the distance in the past" do
        expect(NaturalTime.distance(-2)).to eq "2 seconds ago"
      end
      it "give the distance in the future" do
        expect(NaturalTime.distance(1)).to eq "1 second from now"
      end

      it "give the distance in the future" do
        expect(NaturalTime.distance(2)).to eq "2 seconds from now"
      end
    end
  end

  describe "to_s" do
    it "equal natural_time" do
      (1..100).each do |i|
        expect(NaturalTime.to_string(i)).to eq(NaturalTime.natural_time(i))
      end
    end

    describe "precision" do
      it "limit the precision to 1" do
        expect(NaturalTime.to_string(1.week + 1.minutes + 1.second, :precision => 1)).to eq "1 week"
      end

      it "limit the precision to 2" do
        expect(NaturalTime.to_string(1.week + 1.minutes + 1.second, :precision => 2)).to eq "1 week, 1 minute"
      end
    end
  end

  describe "to_sentence" do
    it "put 'and' before the last entry in the list" do
      expect(NaturalTime.to_sentence(1.minute + 1.second)).to eq "1 minute and 1 second"
    end

    describe "precision" do
      it "limit the precision to 1" do
        expect(NaturalTime.to_sentence(1.week + 1.minutes + 1.second, :precision => 1)).to eq "1 week"
      end

      it "limit the precision to 2" do
        expect(NaturalTime.to_sentence(1.week + 1.minutes + 1.second, :precision => 2)).to eq "1 week and 1 minute"
      end
    end
  end

  describe "to_array" do
    it "returns an array" do
      expect(NaturalTime.to_a(1.minutes + 1.second)).to eq ["1 minute", "1 second"]
    end

    it "returns an array" do
      expect(NaturalTime.to_a(1.minutes + 1.second)).to eq ["1 minute", "1 second"]
    end

    describe "precision" do
      it "limit the precision to 1" do
        expect(NaturalTime.to_a(1.week + 1.minutes + 1.second, :precision => 1)).to eq ["1 week"]
      end

      it "limit the precision to 2" do
        expect(NaturalTime.to_a(1.week + 1.minutes + 1.second, :precision => 2)).to eq ["1 week", "1 minute"]
      end
    end
  end
end

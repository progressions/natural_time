RSpec.describe NaturalTime do
  it "has a version number" do
    expect(NaturalTime::VERSION).not_to be nil
  end

  describe "seconds" do
    it "should return zero seconds" do
      expect(NaturalTime.new(0).natural_time).to eq("0 seconds")
    end

    it "should return singular" do
      expect(NaturalTime.new(1).natural_time).to eq("1 second")
    end

    it "should return seconds" do
      (2..59).each do |i|
        expect(NaturalTime.new(i).natural_time).to eq("#{i} seconds")
      end
    end

    it "should not return 60 seconds" do
      expect(NaturalTime.new(60.seconds).natural_time).not_to match(/60 seconds/)
    end

    it "should return remainder in seconds" do
      expect(NaturalTime.new(65.seconds).natural_time).to match(/ 5 seconds/)
    end
  end

  describe "minutes" do
    it "should return singular" do
      expect(NaturalTime.new(60.seconds).natural_time).to eq "1 minute"
    end

    it "should return whole minutes" do
      (2..59).each do |i|
        expect(NaturalTime.new(i.minutes).natural_time).to eq "#{i} minutes"
      end
    end

    it "should not return 60 minutes" do
      expect(NaturalTime.new(60.minutes).natural_time).not_to match(/60 minutes/)
    end

    it "should return remainder in seconds" do
      expect(NaturalTime.new(65.seconds).natural_time).to eq "1 minute, 5 seconds"
    end
  end

  describe "hours" do
    it "should return singular" do
      expect(NaturalTime.new(1.hour).natural_time).to eq "1 hour"
    end

    it "should return whole hours" do
      (2..23).each do |i|
        expect(NaturalTime.new(i.hours).natural_time).to eq "#{i} hours"
      end
    end

    it "should not return 24 hours" do
      expect(NaturalTime.new(24.hours).natural_time).not_to match(/24 hours/)
    end

    it "should return remainder in minutes" do
      expect(NaturalTime.new(1.hour + 5.minutes).natural_time).to eq "1 hour, 5 minutes"
    end

    it "should return remainder in minutes and seconds" do
      expect(NaturalTime.new(1.hour + 5.minutes + 5.seconds).natural_time).to eq "1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "days" do
    it "should return singular" do
      expect(NaturalTime.new(1.day).natural_time).to eq "1 day"
    end

    it "should return whole days" do
      (2..6).each do |i|
        expect(NaturalTime.new(i.days).natural_time).to eq "#{i} days"
      end
    end

    it "should not return 7 days" do
      expect(NaturalTime.new(7.days).natural_time).not_to match(/7 days/)
    end

    it "should return remainder in hours" do
      expect(NaturalTime.new(1.day + 1.hour).natural_time).to eq "1 day, 1 hour"
    end

    it "should return remainder in hours and minutes" do
      expect(NaturalTime.new(1.day + 1.hour + 5.minutes).natural_time).to eq "1 day, 1 hour, 5 minutes"
    end

    it "should return remainder in hours and minutes and seconds" do
      expect(NaturalTime.new(1.day + 1.hour + 5.minutes + 5.seconds).natural_time).to eq "1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "weeks" do
    it "should return singular" do
      expect(NaturalTime.new(1.week).natural_time).to eq "1 week"
    end

    it "should return whole weeks" do
      (2..4).each do |i|
        expect(NaturalTime.new(i.weeks).natural_time).to eq "#{i} weeks"
      end
    end

    it "should not return 5 weeks" do
      expect(NaturalTime.new(5.weeks).natural_time).not_to match(/5 weeks/)
    end

    it "should return remainder in days" do
      expect(NaturalTime.new(1.week + 1.day).natural_time).to eq "1 week, 1 day"
    end

    it "should return remainder in days and hours" do
      expect(NaturalTime.new(1.week + 1.day + 1.hour).natural_time).to eq "1 week, 1 day, 1 hour"
    end

    it "should return remainder in days and hours and minutes" do
      expect(NaturalTime.new(1.week + 1.day + 1.hour + 5.minutes).natural_time).to eq "1 week, 1 day, 1 hour, 5 minutes"
    end

    it "should return remainder in days and hours and minutes and seconds" do
      expect(NaturalTime.new(1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time).to eq "1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "months" do
    it "should return singular" do
      expect(NaturalTime.new(1.month).natural_time).to eq "1 month"
    end

    it "should return whole months" do
      (2..4).each do |i|
        expect(NaturalTime.new(i.months).natural_time).to eq "#{i} months"
      end
    end

    it "should not return 12 months" do
      expect(NaturalTime.new(13.months).natural_time).not_to match(/13 months/)
    end

    it "should return remainder in weeks" do
      expect(NaturalTime.new(1.month + 1.week).natural_time).to eq "1 month, 1 week"
    end

    it "should return remainder in days" do
      expect(NaturalTime.new(1.month + 1.week + 1.day).natural_time).to eq "1 month, 1 week, 1 day"
    end

    it "should return remainder in days and hours" do
      expect(NaturalTime.new(1.month + 1.week + 1.day + 1.hour).natural_time).to eq "1 month, 1 week, 1 day, 1 hour"
    end

    it "should return remainder in days and hours and minutes" do
      expect(NaturalTime.new(1.month + 1.week + 1.day + 1.hour + 5.minutes).natural_time).to eq "1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end

    it "should return remainder in days and hours and minutes and seconds" do
      expect(NaturalTime.new(1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time).to eq "1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end

  describe "years" do
    it "should return singular" do
      expect(NaturalTime.new(1.year).natural_time).to eq "1 year"
    end

    it "should return whole years" do
      (2..4).each do |i|
        expect(NaturalTime.new(i.years).natural_time).to eq "#{i} years"
      end
    end

    it "should return remainder in months" do
      expect(NaturalTime.new(1.year + 1.month).natural_time).to eq "1 year, 1 month"
    end

    it "should return remainder in months and weeks" do
      expect(NaturalTime.new(1.year + 1.month + 1.week).natural_time).to eq "1 year, 1 month, 1 week"
    end

    it "should return remainder in months and days" do
      expect(NaturalTime.new(1.year + 1.month + 1.week + 1.day).natural_time).to eq "1 year, 1 month, 1 week, 1 day"
    end

    it "should return remainder in months and days and hours" do
      expect(NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour).natural_time).to eq "1 year, 1 month, 1 week, 1 day, 1 hour"
    end

    it "should return remainder in months and days and hours and minutes" do
      expect(NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes).natural_time).to eq "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end

    it "should return remainder in months and days and hours and minutes and seconds" do
      expect(NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time).to eq "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end

    describe "precision" do
      it "should limit the precision to 1" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 1).natural_time).to eq "1 week"
      end

      it "should limit the precision to 2" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 2).natural_time).to eq "1 week, 1 minute"
      end

      it "should show the distance with precision of 1 in the past" do
        distance = -1 * (1.week + 1.minutes + 1.second)
        expect(NaturalTime.new(distance, :precision => 1).distance).to eq "1 week ago"
      end

      it "should show the distance with precision of 2 in the past" do
        distance = -1 * (1.week + 1.minutes + 1.second)
        expect(NaturalTime.new(distance, :precision => 2).distance).to eq "1 week and 1 minute ago"
      end

      it "should show the distance with precision of 1 in the future" do
        distance = (1.week + 1.minutes + 1.second)
        expect(NaturalTime.new(distance, :precision => 1).distance).to eq "1 week from now"
      end

      it "should show the distance with precision of 2 in the future" do
        distance = (1.week + 1.minutes + 1.second)
        expect(NaturalTime.new(distance, :precision => 2).distance).to eq "1 week and 1 minute from now"
      end
    end

    describe "distances" do
      it "should give the distance in the past" do
        expect(NaturalTime.new(-1).distance).to eq "1 second ago"
      end

      it "should give the distance in the past" do
        expect(NaturalTime.new(-2).distance).to eq "2 seconds ago"
      end
      it "should give the distance in the future" do
        expect(NaturalTime.new(1).distance).to eq "1 second from now"
      end

      it "should give the distance in the future" do
        expect(NaturalTime.new(2).distance).to eq "2 seconds from now"
      end
    end
  end

  describe "to_s" do
    it "should equal natural_time" do
      (1..100).each do |i|
        @natural_time = NaturalTime.new(i)
        expect(@natural_time.to_s).to eq @natural_time.natural_time
      end
    end

    describe "precision" do
      it "should limit the precision to 1" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 1).to_s).to eq "1 week"
      end

      it "should limit the precision to 2" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 2).to_s).to eq "1 week, 1 minute"
      end
    end
  end

  describe "to_sentence" do
    it "should put 'and' before the last entry in the list" do
      expect(NaturalTime.new(1.minute + 1.second).to_sentence).to eq "1 minute and 1 second"
    end

    describe "precision" do
      it "should limit the precision to 1" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 1).to_sentence).to eq "1 week"
      end

      it "should limit the precision to 2" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 2).to_sentence).to eq "1 week and 1 minute"
      end
    end
  end

  describe "to_array" do
    it "should return an array" do
      expect(NaturalTime.new(1.minutes + 1.second).to_array).to eq ["1 minute", "1 second"]
    end

    it "should return an array" do
      expect(NaturalTime.new(1.minutes + 1.second).to_a).to eq ["1 minute", "1 second"]
    end

    describe "precision" do
      it "should limit the precision to 1" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 1).to_a).to eq ["1 week"]
      end

      it "should limit the precision to 2" do
        expect(NaturalTime.new(1.week + 1.minutes + 1.second, :precision => 2).to_a).to eq ["1 week", "1 minute"]
      end
    end
  end
end

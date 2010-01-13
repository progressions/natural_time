require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Naturaltime" do
  describe "seconds" do
    it "should return zero seconds" do
      NaturalTime.new(0).natural_time.should == "0 seconds"
    end
    
    it "should return singular" do
      NaturalTime.new(1).natural_time.should == "1 second"
    end
    
    it "should return seconds" do
      (2..59).each do |i|
        NaturalTime.new(i).natural_time.should == "#{i} seconds"
      end
    end
    
    it "should not return 60 seconds" do
      NaturalTime.new(60.seconds).natural_time.should_not match(/60 seconds/)
    end
    
    it "should return remainder in seconds" do
      NaturalTime.new(65.seconds).natural_time.should match(/ 5 seconds/)
    end
  end
  
  describe "minutes" do
    it "should return singular" do
      NaturalTime.new(60.seconds).natural_time.should == "1 minute"
    end
    
    it "should return whole minutes" do
      (2..59).each do |i|
        NaturalTime.new(i.minutes).natural_time.should == "#{i} minutes"
      end
    end
    
    it "should not return 60 minutes" do
      NaturalTime.new(60.minutes).natural_time.should_not match(/60 minutes/)
    end
    
    it "should return remainder in seconds" do
      NaturalTime.new(65.seconds).natural_time.should == "1 minute, 5 seconds"
    end
  end
  
  describe "hours" do
    it "should return singular" do
      NaturalTime.new(1.hour).natural_time.should == "1 hour"
    end
    
    it "should return whole hours" do
      (2..23).each do |i|
        NaturalTime.new(i.hours).natural_time.should == "#{i} hours"
      end
    end
    
    it "should not return 24 hours" do
      NaturalTime.new(24.hours).natural_time.should_not match(/24 hours/)
    end
    
    it "should return remainder in minutes" do
      NaturalTime.new(1.hour + 5.minutes).natural_time.should == "1 hour, 5 minutes"
    end
    
    it "should return remainder in minutes and seconds" do
      NaturalTime.new(1.hour + 5.minutes + 5.seconds).natural_time.should == "1 hour, 5 minutes, 5 seconds"
    end
  end
  
  describe "days" do
    it "should return singular" do
      NaturalTime.new(1.day).natural_time.should == "1 day"
    end
    
    it "should return whole days" do
      (2..6).each do |i|
        NaturalTime.new(i.days).natural_time.should == "#{i} days"
      end
    end
    
    it "should not return 7 days" do
      NaturalTime.new(7.days).natural_time.should_not match(/7 days/)
    end
    
    it "should return remainder in hours" do
      NaturalTime.new(1.day + 1.hour).natural_time.should == "1 day, 1 hour"
    end
    
    it "should return remainder in hours and minutes" do
      NaturalTime.new(1.day + 1.hour + 5.minutes).natural_time.should == "1 day, 1 hour, 5 minutes"
    end
    
    it "should return remainder in hours and minutes and seconds" do
      NaturalTime.new(1.day + 1.hour + 5.minutes + 5.seconds).natural_time.should == "1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end
  
  describe "weeks" do
    it "should return singular" do
      NaturalTime.new(1.week).natural_time.should == "1 week"
    end
    
    it "should return whole weeks" do
      (2..4).each do |i|
        NaturalTime.new(i.weeks).natural_time.should == "#{i} weeks"
      end
    end
    
    it "should not return 5 weeks" do
      NaturalTime.new(5.weeks).natural_time.should_not match(/5 weeks/)
    end
    
    it "should return remainder in days" do
      NaturalTime.new(1.week + 1.day).natural_time.should == "1 week, 1 day"
    end
    
    it "should return remainder in days and hours" do
      NaturalTime.new(1.week + 1.day + 1.hour).natural_time.should == "1 week, 1 day, 1 hour"
    end
    
    it "should return remainder in days and hours and minutes" do
      NaturalTime.new(1.week + 1.day + 1.hour + 5.minutes).natural_time.should == "1 week, 1 day, 1 hour, 5 minutes"
    end
    
    it "should return remainder in days and hours and minutes and seconds" do
      NaturalTime.new(1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time.should == "1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end
  
  describe "months" do
    it "should return singular" do
      NaturalTime.new(1.month).natural_time.should == "1 month"
    end
    
    it "should return whole months" do
      (2..4).each do |i|
        NaturalTime.new(i.months).natural_time.should == "#{i} months"
      end
    end
    
    it "should not return 12 months" do
      NaturalTime.new(13.months).natural_time.should_not match(/13 months/)
    end
    
    it "should return remainder in weeks" do
      NaturalTime.new(1.month + 1.week).natural_time.should == "1 month, 1 week"
    end
    
    it "should return remainder in days" do
      NaturalTime.new(1.month + 1.week + 1.day).natural_time.should == "1 month, 1 week, 1 day"
    end
    
    it "should return remainder in days and hours" do
      NaturalTime.new(1.month + 1.week + 1.day + 1.hour).natural_time.should == "1 month, 1 week, 1 day, 1 hour"
    end
    
    it "should return remainder in days and hours and minutes" do
      NaturalTime.new(1.month + 1.week + 1.day + 1.hour + 5.minutes).natural_time.should == "1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end
    
    it "should return remainder in days and hours and minutes and seconds" do
      NaturalTime.new(1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time.should == "1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end
  
  describe "years" do
    it "should return singular" do
      NaturalTime.new(1.year).natural_time.should == "1 year"
    end
    
    it "should return whole years" do
      (2..4).each do |i|
        NaturalTime.new(i.years).natural_time.should == "#{i} years"
      end
    end
    
    it "should return remainder in months" do
      NaturalTime.new(1.year + 1.month).natural_time.should == "1 year, 1 month"
    end
    
    it "should return remainder in months and weeks" do
      NaturalTime.new(1.year + 1.month + 1.week).natural_time.should == "1 year, 1 month, 1 week"
    end
    
    it "should return remainder in months and days" do
      NaturalTime.new(1.year + 1.month + 1.week + 1.day).natural_time.should == "1 year, 1 month, 1 week, 1 day"
    end
    
    it "should return remainder in months and days and hours" do
      NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour).natural_time.should == "1 year, 1 month, 1 week, 1 day, 1 hour"
    end
    
    it "should return remainder in months and days and hours and minutes" do
      NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes).natural_time.should == "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes"
    end
    
    it "should return remainder in months and days and hours and minutes and seconds" do
      NaturalTime.new(1.year + 1.month + 1.week + 1.day + 1.hour + 5.minutes + 5.seconds).natural_time.should == "1 year, 1 month, 1 week, 1 day, 1 hour, 5 minutes, 5 seconds"
    end
  end
  
  describe "to_s" do
    it "should equal natural_time" do
      (1..100).each do |i|
        @natural_time = NaturalTime.new(i)
        @natural_time.to_s.should == @natural_time.natural_time
      end
    end
  end
  
  describe "to_sentence" do
    it "should put 'and' before the last entry in the list" do
      NaturalTime.new(1.minute + 1.second).to_sentence.should == "1 minute and 1 second"
    end
  end
  
  describe "to_array" do
    it "should return an array" do
      NaturalTime.new(1.minutes + 1.second).to_array.should == ["1 minute", "1 second"]
    end
  end
end

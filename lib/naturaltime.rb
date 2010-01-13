require 'rubygems'
require 'active_support'

class NaturalTime
  attr_accessor :duration, :natural_time
  
  def initialize(duration_in_seconds)
    duration_in_seconds = duration_in_seconds.to_i
    @duration = duration_in_seconds
    elapsed_time = []

    seconds_left = duration_in_seconds
    
    years = seconds_left / 1.year
    elapsed_time << "#{years.to_i} years"
    seconds_left = seconds_left % 1.year
    
    months = seconds_left / 1.month
    elapsed_time << "#{months.to_i} months"
    seconds_left = seconds_left % 1.month
     
    weeks = seconds_left / 1.week
    elapsed_time << "#{weeks.to_i} weeks"
    seconds_left = seconds_left % 1.week
    
    days = seconds_left / 1.day
    elapsed_time << "#{days.to_i} days"
    seconds_left = seconds_left % 1.day
    
    hours = seconds_left / 1.hour
    elapsed_time << "#{hours.to_i} hours"
    seconds_left = seconds_left % 1.hour
    
    minutes = seconds_left / 1.minute
    elapsed_time << "#{minutes.to_i} minutes"
    seconds = seconds_left % 1.minute
    
    elapsed_time << "#{seconds.to_i} seconds"
    
    @natural_time = elapsed_time.join(", ")
  end
  
  def to_s
    natural_time
  end
end
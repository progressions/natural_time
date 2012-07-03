require 'rubygems'
require 'active_support/core_ext/integer'
require 'active_support/core_ext/numeric'

class NaturalTime
  attr_accessor :duration, :precision, :past

  UNITS_OF_TIME = [["year", "years"], ["month", "months"], ["week", "weeks"], ["day", "days"], ["hour", "hours"], ["minute", "minutes"]]
  
  def initialize(duration_in_seconds, options={})
    @precision = options[:precision]
    duration_in_seconds = duration_in_seconds.to_i
    @past = duration_in_seconds < 1
    @duration = duration_in_seconds.abs
    elapsed_time = elapsed_time(duration_in_seconds)
  end
  
  def to_sentence
    to_array.to_sentence
  end
  
  def natural_time
    to_array.join(", ")
  end
  
  def to_s
    natural_time
  end
  
  def to_a
    elapsed_time(duration)
  end
  
  def to_array
    to_a
  end
  
  def distance
    if past
      modifier = "ago"
    else
      modifier = "from now"
    end
    "#{to_sentence} #{modifier}"
  end
  
  def elapsed_time(duration_in_seconds)
    return "0 seconds" if duration_in_seconds <= 0

    elapsed_time = []

    seconds_left = duration_in_seconds
    
    UNITS_OF_TIME.each do |period|
      amount = (seconds_left / 1.send(period.first)).to_i
      str = amount == 1 ? period[0] : period[1]
      elapsed_time << "#{amount} #{str}" if amount > 0
      seconds_left = seconds_left % 1.send(period.first)
    end
    
    seconds = seconds_left % 1.minute
    str = seconds == 1 ? "second" : "seconds"
    elapsed_time << "#{seconds.to_i} #{str}" unless (seconds == 0 && elapsed_time.compact.length > 0)    
    
    if precision
      elapsed_time.compact.first(precision)
    else
      elapsed_time.compact
    end
  end
end

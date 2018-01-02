require "natural_time/version"
require 'active_support/core_ext/integer/time'

module NaturalTime
  UNITS_OF_TIME = [["year", "years"], ["month", "months"], ["week", "weeks"], ["day", "days"], ["hour", "hours"], ["minute", "minutes"]]

  class << self
    def natural_time(duration_in_seconds, options={})
      to_array(duration_in_seconds, options).join(", ")
    end

    def distance(duration_in_seconds, options={})
      if duration_in_seconds < 1
        modifier = "ago"
      else
        modifier = "from now"
      end
      "#{to_sentence(duration_in_seconds, options)} #{modifier}"
    end

    def to_string(duration, options={})
      natural_time(duration, options)
    end

    def to_sentence(duration, options={})
      to_array(duration, options).to_sentence
    end

    def to_a(duration, options={})
      [elapsed_time(duration, options)].flatten
    end

    def to_array(duration, options={})
      to_a(duration, options)
    end

    def elapsed_time(duration_in_seconds, options={})
      duration_in_seconds = duration_in_seconds.to_i.abs

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

      if options[:precision]
        elapsed_time.compact.first(options[:precision])
      else
        elapsed_time.compact
      end
    end
  end
end

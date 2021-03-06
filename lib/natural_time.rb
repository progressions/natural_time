require "natural_time/version"
require 'active_support/core_ext/integer/time'

# # NaturalTime
#
# NaturalTime outputs a duration in natural language.
#
# ## Usage
#
# ### Sentence
#
# The `to_sentence` method will output the duration in time in natural language
# and formatted like a sentence.
#
#     NaturalTime.to_sentence(65)         #=> "1 minute and 5 seconds"
#
#     NaturalTime.to_sentence(120)        #=> "2 minutes"
#
#     NaturalTime.to_sentence(10000)      #=> "2 hours, 46 minutes, and 40 seconds"
#
# ### String
#
# The `to_s` command will separate the units with commas but with no "and":
#
#     NaturalTime.to_s(65)                #=> "1 minute, 5 seconds"
#
#     NaturalTime.to_s(10000)             #=> "2 hours, 46 minutes, 40 seconds"
#
# ### Array
#
# NaturalTime instances can also be output to an array with `to_array`:
#
#     NaturalTime.to_array(65)                #=> ["1 minutes", "5 seconds"]
#
#     NaturalTime.to_array(120)               #=> ["2 minutes"]
#
# ### Precision
#
# NaturalTime can return the amount of time to a specific precision. If all
# you want is the greatest unit:
#
#     NaturalTime.to_sentence(65, precision: 1)    #=> "1 minute"
#
#     NaturalTime.to_sentence(10000, precision: 1) #=> "2 hours"
#
#     NaturalTime.to_sentence(10000, precision: 2) #=> "2 hours and 46 minutes"
#
# ### Distance
#
# If you want to use NaturalTime to show an elapsed time and you don't care if it's in the
# past or the future, use the `natural_time` or `to_sentence` methods, or the
# `to_array` method if you need the units in an array.
#
# If you're measuring distances that may be in the past or the future, the `distance`
# method will return a sentence indicating how long ago or in the future is your duration.
#
#     NaturalTime.distance(65)                      #=> "1 minute and 5 seconds from now"
#
#     NaturalTime.distance(-65)                     #=> "1 minute and 5 seconds ago"
#
# It works with `:precision` too:
#
#     NaturalTime.distance(10000, precision: 1)     #=> "2 hours from now"
#
#     NaturalTime.distance(-10000, precision: 2)    #=> "2 hours and 46 minutes ago"
#
module NaturalTime
  class << self
    # Return a natural-language representation of a duration in time.
    #
    # @param [Integer] duration a duration in time
    # @param [Integer] precision level of precision for the
    #   natural-language representation
    #
    # @return [String]
    #
    # @example
    #   NaturalTime.natural_time(65)         #=> "1 minute, 5 seconds"
    #
    #   NaturalTime.natural_time(120)        #=> "2 minutes"
    #
    #   NaturalTime.natural_time(10000)      #=> "2 hours, 46 minutes, 40 seconds"
    #
    def natural_time(duration, precision: nil)
      to_array(duration, precision: precision).join(", ")
    end

    # Return a natural-language representation of a distance in time, relative
    # to now.
    #
    # @param [Integer] duration a duration in time
    # @param [Integer] precision level of precision for the
    #   natural-language representation
    #
    # @return [String]
    #
    # @example
    #   If you're measuring distances that may be in the past or the future, the `distance`
    #   method will return a sentence indicating how long ago or in the future is your duration.
    #
    #   NaturalTime.distance(65)                      #=> "1 minute and 5 seconds from now"
    #
    #   NaturalTime.distance(-65)                     #=> "1 minute and 5 seconds ago"
    #
    # @example
    #   It works with `:precision` too:
    #
    #   NaturalTime.distance(10000, precision: 1)     #=> "2 hours from now"
    #
    #   NaturalTime.distance(-10000, precision: 2)    #=> "2 hours and 46 minutes ago"
    #
    def distance(duration, precision: nil)
      if duration.to_i < 1
        modifier = "ago"
      else
        modifier = "from now"
      end
      "#{to_sentence(duration, precision: precision)} #{modifier}"
    end

    # Return a natural-language representation of a duration in time, separating the
    # units with commas but with no "and".
    #
    # @param [Integer] duration a duration in time
    # @param [Integer] precision level of precision for the
    #   natural-language representation
    #
    # @return [String]
    #
    # @example
    #   NaturalTime.to_s(65)                #=> "1 minute, 5 seconds"
    #
    #   NaturalTime.to_s(10000)             #=> "2 hours, 46 minutes, 40 seconds"
    #
    def to_string(duration, precision: nil)
      natural_time(duration, precision: precision)
    end

    # Return the duration in time in natural-language and formatted like a sentence.
    #
    # @param [Integer] duration a duration in time
    # @param [Integer] precision level of precision for the
    #   natural-language representation
    #
    # @return [String]
    #
    # @example
    #   NaturalTime.to_sentence(65)         #=> "1 minute and 5 seconds"
    #
    #   NaturalTime.to_sentence(120)        #=> "2 minutes"
    #
    #   NaturalTime.to_sentence(10000)      #=> "2 hours, 46 minutes, and 40 seconds"
    #
    def to_sentence(duration, precision: nil)
      to_array(duration, precision: precision).to_sentence
    end

    # Return the natural-language elements of a duration in an array.
    #
    # @param [Integer] duration a duration in time
    # @param [Integer] precision level of precision for the
    #   natural-language representation
    #
    # @return [Array<String>]
    #
    # @example
    #   NaturalTime.to_array(65)                #=> ["1 minutes", "5 seconds"]
    #
    #   NaturalTime.to_array(120)               #=> ["2 minutes"]
    #
    def to_array(duration, precision: nil)
      [elapsed_time(duration, precision: precision)].flatten
    end

    private

    UNITS_OF_TIME = [["year", "years"], ["month", "months"], ["week", "weeks"], ["day", "days"], ["hour", "hours"], ["minute", "minutes"]]

    def elapsed_time(duration, precision: nil)
      duration = duration.to_i.abs

      return "0 seconds" if duration <= 0

      elapsed_time = []

      seconds_left = duration

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
end

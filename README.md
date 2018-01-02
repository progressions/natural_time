# NaturalTime

NaturalTime outputs a duration in natural language.

## Usage

### Sentence

The `to_sentence` method will output the duration in time in natural language
and formatted like a sentence.

    NaturalTime.to_sentence(65)         #=> "1 minute and 5 seconds"

    NaturalTime.to_sentence(120)        #=> "2 minutes"

    NaturalTime.to_sentence(10000)      #=> "2 hours, 46 minutes, and 40 seconds"

### String

The `to_s` command will separate the units with commas but with no "and":

    NaturalTime.to_s(65)                #=> "1 minute, 5 seconds"

    NaturalTime.to_s(10000)             #=> "2 hours, 46 minutes, 40 seconds"

### Array

NaturalTime instances can also be output to an array with `to_a`:

    NaturalTime.to_a(65)                #=> ["1 minutes", "5 seconds"]

    NaturalTime.to_a(120)               #=> ["2 minutes"]

### Precision

NaturalTime can return the amount of time to a specific precision.  If all you want is the greatest unit:

    NaturalTime.to_sentence(65, precision: 1)    #=> "1 minute"

    NaturalTime.to_sentence(10000, precision: 1) #=> "2 hours"

    NaturalTime.to_sentence(10000, precision: 2) #=> "2 hours and 46 minutes"

### Distance

If you want to use NaturalTime to show an elapsed time and you don't care if it's in the
past or the future, use the `natural_time` or `to_sentence` methods, or the
`to_a` method if you need the units in an array.

If you're measuring distances that may be in the past or the future, the `distance`
method will return a sentence indicating how long ago or in the future is your duration.

    NaturalTime.distance(65)                      #=> "1 minute and 5 seconds from now"

    NaturalTime.distance(-65)                     #=> "1 minute and 5 seconds ago"

It works with `:precision` too:

    NaturalTime.distance(10000, precision: 1)     #=> "2 hours from now"

    NaturalTime.distance(-10000, precision: 2)    #=> "2 hours and 46 minutes ago"


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2018 Isaac Priestley. See LICENSE for details.

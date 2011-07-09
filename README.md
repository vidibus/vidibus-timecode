# Vidibus::Timecode [![](http://travis-ci.org/vidibus/vidibus-timecode.png)](http://travis-ci.org/vidibus/vidibus-timecode)

Timecodes are a simple, yet powerful way to notate times.

This gem is part of [Vidibus](http://vidibus.org), an open source toolset for building distributed (video) applications.


## Installation

Add `gem "vidibus-timecode"` to your Gemfile. Then call `bundle install` on your console.


## Usage

A timecode instance requires at least one parameter. Valid inputs are time objects and timecode strings:

```ruby
Vidibus::Timecode.new(Time.now)
Vidibus::Timecode.new("2011/12/07@21:00")
```

A timecode instance provides two methods, `timecode` and `time`:

```ruby
Vidibus::Timecode.new(Time.now).timecode
# => "2011/12/07@21:00"

Vidibus::Timecode.new("2011/12/07@21:00").time
# => Wed Dec 07 21:00:00 +0100 2011
```


## Syntax

Timecodes may be used to describe single, definite times or multiple, even random times. Each timecode is
comprised of a date and a time part, joined by "@": `#{date}@#{time}`

As shown above, a timecode object may represent a single time:

```ruby
"2011/12/07@21:00" # Wed Dec 07 21:00:00 +0100 2011
```

But timecodes may also be used to define repeating times, like cron. Timcode will return the next future time:

```ruby
"7@21:00" # next 7th of a month, e.g. Thu Jul 07 21:00:00 +0200 2011
```
  
When defining a range, Timecode will output a random time within range defined:

```ruby
"2011/12/07@21:00-23:55" # e.g. Wed Dec 07 22:13:45 +0100 2011
```

**Please note:** Only the basic for has been implemented already.


### Examples

Some syntax examples:

```ruby
  "7@21"                              # each 7th of each month at 21:00
  "7@21:00"                           # each 7th of each month at 21:00
  "12/7@21:00"                        # each 7th of each december at 21:00
  "2011/12/07@21:00"                  # on 7th of december 2011 at 21:00
  "2011/12/07,23@21:00"               # on 7th and 23rd of december 2011 at 21:00
  "2011/12/07-23@21:00"               # between 7th and 23rd of december 2011 at 21:00
  "2011/11,12/07-23@21:00"            # between 7th and 23rd of november and between 7th and 23rd of december 2011 at 21:00
  "2011/11-12/07-23@21:00"            # between 7th and 23rd of november or december 2011 at 21:00
  "2011/12/07,2012/01/04@21:00,22:30" # on 7th of december 2011 and on 4th of january 2012 at 21:00 and 22:30
```

## TODO

* Allow range input
* Allow list input
* Allow precision option: `:seconds` or `:miliseconds`
* Add method #explain to print timecode in words


## Copyright

&copy; 2011 Andre Pankratz. See LICENSE for details.

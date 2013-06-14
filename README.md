# Vidibus::Timecode [![](http://travis-ci.org/vidibus/vidibus-timecode.png)](http://travis-ci.org/vidibus/vidibus-timecode) [![](http://stillmaintained.com/vidibus/vidibus-timecode.png)](http://stillmaintained.com/vidibus/vidibus-timecode)

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


### Examples

Some syntax examples:

```ruby
# each 7th of every month at 21:00
"7@21"

# each 7th of every month at 21:00
"7@21:00"

# each 7th of december every year at 21:00
"12/7@21:00"

# on 7th of december 2011 at 21:00
"2011/12/07@21:00"
```


### More Examples (not implemented yet)

In the future Vidibus::Timecode will be able to handle collections, ranges and random times:

```ruby
# on 7th and 23rd of december 2011 at 21:00
"2011/12/07+23@21:00"

# from 7th to 23rd of december 2011 at 21:00
"2011/12/07-23@21:00"

# on 7th or 23rd of december 2011 at 21:00
"2011/12/07,23@21:00"

# on one day between 7th and 23rd of december 2011 at 21:00
"2011/12/07~23@21:00"

# from 7th to 23rd of november and from 7th to 23rd of december 2011 at 21:00
"2011/11+12/07-23@21:00"

# between 7th and 23rd of november or december 2011 at 21:00
"2011/11,12/07-23@21:00"
```


## TODO

* Allow range input
* Allow list input
* Allow precision option: `:seconds` or `:miliseconds`
* Add method `explain` to print timecode in words
* Allow timecodes without date or time: `"@21" # everyday at 21:00`


## Copyright

&copy; 2011 Andre Pankratz. See LICENSE for details.

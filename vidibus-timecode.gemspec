# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "vidibus/timecode"

Gem::Specification.new do |s|
  s.name        = "vidibus-timecode"
  s.version     = Vidibus::Timecode::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Andre Pankratz"
  s.email       = "andre@vidibus.com"
  s.homepage    = "https://github.com/vidibus/vidibus-timecode"
  s.summary     = "Timecodes are a simple, yet powerful way to notate times."
  s.description = "Timecodes may be used to describe single, definite times or multiple, even random times."
  s.license     = 'MIT'

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vidibus-timecode"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "rcov"
  s.add_development_dependency "rspec", "~> 2"
  s.add_development_dependency "rr"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end

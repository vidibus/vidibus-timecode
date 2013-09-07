require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$:.unshift File.expand_path('../../', __FILE__)

require "rubygems"
require "rspec"
require "rr"
require "vidibus-timecode"

RSpec.configure do |config|
  config.mock_with :rr
end

module Vidibus
  class Timecode
    VERSION = "0.1.0"

    YEAR_REGEXP = /(\d{3,4}(?:[,\-]\d{3,4})?)/
    MONTH_REGEXP = /(\d{1,2}(?:[,\-]\d{1,2})?)/
    DAY_REGEXP = /(\d{1,2}(?:[,\-]\d{1,2})?)/
    TIME_REGEXP = /(\d{1,2}(?:[,\-]\d{1,2})?)/
    REGEXP = /^(?:#{YEAR_REGEXP}\/)?(?:#{MONTH_REGEXP}\/)?#{DAY_REGEXP}@#{TIME_REGEXP}(?:\:#{TIME_REGEXP}){0,2}$/

    class Error < StandardError; end
    class InputError < Error; end
    class FormatError < Error; end

    def initialize(*args)
      options = extract_options!(args)
      @input = args.first or raise_input_error
      process_input
    end

    def timecode
      @timecode ||= @time.strftime("%Y/%m/%d@%H:%M")
    end

    def time
      @time ||= parse_timecode
    end

    protected

    def process_input
      if @input.is_a?(Time)
        @time = @input
      elsif @input.is_a?(String)
        @timecode = @input
        time # trigger parsing of timecode for validation
      else
        raise_input_error
      end
    end

    def extract_options!(args)
      args.last.is_a?(Hash) and args.last.instance_of?(Hash) ? args.pop : {}
    end

    def parse_timecode
      if m = timecode.match(REGEXP)
        year = m[1] || Time.now.strftime("%Y")
        month = m[2] || Time.now.strftime("%m")
        day = m[3]
        hour = m[4].to_i
        minute = m[5].to_i

        Time.local(year, month, day, hour, minute).tap do |time|
          time.in_time_zone if time.respond_to?(:in_time_zone)
        end
      else
        raise(FormatError)
      end
    end

    def raise_input_error
      raise(InputError, "Please provide Time or Timecode input.")
    end
  end
end

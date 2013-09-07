require "spec_helper"

describe "Vidibus::Timecode" do
  let(:timecode) {"2011/12/07@21:00"}
  let(:time) {Time.parse("2011-12-07 21:00")}

  describe "initializing" do
    it "should require arguments" do
      expect {Vidibus::Timecode.new}.to raise_error(Vidibus::Timecode::InputError, "Please provide Time or Timecode input.")
    end

    it "should accept a Time" do
      expect {Vidibus::Timecode.new(time)}.not_to raise_error
    end

    it "should accept a Timecode string" do
      expect {Vidibus::Timecode.new(timecode)}.not_to raise_error
    end

    it "should raise an FormatError for invalid Timecode input" do
      expect {Vidibus::Timecode.new("2011/12/07")}.
        to raise_error(Vidibus::Timecode::FormatError)
    end
  end

  describe "#time" do
    let(:this) {Vidibus::Timecode.new(timecode)}

    it "should return time input" do
      Vidibus::Timecode.new(time).time.should === time
    end

    it "should try to use Rails' #in_time_zone by default" do
      mock.any_instance_of(Time).in_time_zone
      this.time
    end

    it "should return a local time object by default" do
      this.time.should eql(time.localtime)
    end

    context 'with seconds' do
      let(:time) { Time.parse('2011-12-07 21:00:39') }
      let(:timecode) { '2011/12/07@21:00:39' }

      it "should return the timecode of a given time" do
        this.time.should eql(time.localtime)
      end
    end
  end

  describe "#timecode" do
    let(:this) {Vidibus::Timecode.new(time)}

    it "should return the timecode input" do
      Vidibus::Timecode.new(timecode).timecode.should === timecode
    end

    it "should return the timecode of a given time" do
      this.timecode.should eql(timecode)
    end

    context 'with precision: :seconds' do
      let(:time) { Time.parse('2011-12-07 21:00:39') }
      let(:timecode) { '2011/12/07@21:00:39' }
      let(:this) { Vidibus::Timecode.new(time, precision: :seconds) }

      it "should return the timecode of a given time" do
        this.timecode.should eql(timecode)
      end
    end
  end

  # describe "speed test" do
  #   let(:iterations) {100000}
  #   let(:year) {2011}
  #   let(:month) {12}
  #   let(:day) {7}
  #   let(:hour) {21}
  #   let(:minute) {4}
  #   let(:time) {Time.local(year, month, day, hour, minute)}
  #
  #   it "of Time.local" do
  #     iterations.times do
  #       Time.local(year, month, day, hour, minute)
  #     end
  #   end
  #
  #   it "of Time.parse" do
  #     iterations.times do
  #       Time.parse("#{year}-#{month}-#{day} #{hour}:#{minute}")
  #     end
  #   end
  #
  #   it "of rescuing a failed method call" do
  #     iterations.times do
  #       begin
  #         time.invalid
  #       rescue NoMethodError
  #         time
  #       end
  #     end
  #   end
  #
  #   it "of checking #respond_to?" do
  #     if time.respond_to?(:invalid)
  #       time.invalid
  #     else
  #       time
  #     end
  #   end
  # end
end

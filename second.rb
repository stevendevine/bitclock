require 'date'
require 'pp'
require 'matrix'

class Second

  # 23 34 34 bit column height
  # 24:59:59 time max for column

  def initialize(seconds = seconds_since_midnight)
    self.seed = seconds
  end

  def seed
    @seed
  end

  def to_a
    seconds_to_base_2_array(seed)
  end

  def to_matrix
    zero_padded_array = zero_pad_columns to_a
    Matrix.build(4,6) { |row, col| 0 }

  end

  #private

    def zero_pad_columns(base_2_ary)

    end

    def seconds_to_base_2_array(seconds)
      base_10_ary_to_base_2_ary(seconds_to_base_10_array(seconds))
    end

    def seed=(val)
      @seed=val
    end

    # returns array of big-endian column arrays
    def base_10_ary_to_base_2_ary(base10ary)
      base2ary = []
      base10ary.each do |digit|
        base2ary << digit.to_s(2).split(//).map { |x| x.to_i }.reverse
      end
      base2ary
    end

    def seconds_to_base_10_array(seconds)
      datetime = DateTime.strptime(seconds.to_s,"%s")
      hour = datetime.strftime("%H").to_i
      minute = datetime.strftime("%M").to_i
      second = datetime.strftime("%S").to_i
      *digits = left_digit(hour), right_digit(hour), left_digit(minute), right_digit(minute), left_digit(second), right_digit(second)
    end

    def left_digit(two_digit_number)
      (two_digit_number - two_digit_number % 10) / 10
    end

    def right_digit(two_digit_number)
      two_digit_number % 10
    end

    def seconds_since_midnight
      datetime = DateTime.now
      hour = datetime.strftime("%H").to_i
      minute = datetime.strftime("%M").to_i
      second = datetime.strftime("%S").to_i
      second + minute * 60 + hour * 3600
    end

end
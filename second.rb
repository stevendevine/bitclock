require 'date'

class Second

  # 23 34 34 bit column height
  # 24:59:59 time max for column

  def initialize(seconds = seconds_since_midnight)
    self.seed = seconds
  end

  def seed
    @seed
  end

  def seed=(val)
    @seed=val
  end

  #private

    def digits_to_columns(digits)

    end

    def col_height(index)
      [2,4,3,4,3,4][index]
    end

    def seconds_to_digits(seconds)
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
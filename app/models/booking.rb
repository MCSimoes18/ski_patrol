class Booking < ApplicationRecord
  belongs_to :mountain_instructor
  belongs_to :student

  # validate :book_time_valid?
  #
  # def book_time_valid?
  #   if (params["time_booked"]["book_time(1i)"].to_i).exist? && (params["time_booked"]["book_time(2i)"].to_i).exist? && (params["time_booked"]["book_time(3i)"].to_i).exist? && (params["time_booked"]["book_time(4i)"].to_i).exist? && (params["time_booked"]["book_time(5i)"].to_i).exist?
  #     errors.add(:book_time, "Please Fill Out All Time")
  #   end
  # end


  def format_time
    self.book_time.strftime("%B %d, %Y, %k:%M")
  end

  def duration_arr
    [1,2,3]
  end


end

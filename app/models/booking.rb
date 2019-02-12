class Booking < ApplicationRecord
  belongs_to :mountain_instructor
  belongs_to :student

  def format_time
    self.book_time.strftime("%B %d, %Y, %k:%M")
  end

  def duration_arr
    [1,2,3]
  end


end

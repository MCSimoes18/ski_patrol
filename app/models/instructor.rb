class Instructor < ApplicationRecord
  has_many :mountain_instructors
  has_many :mountains, through: :mountain_instructors
  has_many :bookings, through: :mountain_instructors
  has_many :students, through: :bookings
  has_many :reviews

  has_secure_password


def upcoming_bookings
  self.bookings.select do |book|
    book.book_time > DateTime.now
  end
end

  def previous_bookings
    self.bookings.select do |book|
      book.book_time < DateTime.now
    end
  end

end

class Student < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :mountain_instructors, through: :bookings
  has_many :instructors, through: :mountain_instructors

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

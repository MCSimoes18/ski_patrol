class Instructor < ApplicationRecord
  has_secure_password
  has_many :mountain_instructors
  has_many :mountains, through: :mountain_instructors
  has_many :bookings, through: :mountain_instructors
  has_many :students, through: :bookings
  has_many :reviews
  # accepts_nested_attributes_for :mountain_instructors
  accepts_nested_attributes_for :mountains



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

  def mountains=(mountain_ids_array)
    mountain_ids_array.each do|mountain_id|
      # byebug
      if mountain_id != ""
        MountainInstructor.create(instructor_id: self.id, mountain_id: mountain_id)
      else
      end
    end
  end

  def mountain_names
    self.mountains.map do|mountain|
      mountain.name
    end
  end

end

class MountainInstructor < ApplicationRecord
  belongs_to :instructor
  belongs_to :mountain
  has_many :bookings
end

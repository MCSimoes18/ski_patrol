class Mountain < ApplicationRecord
  has_many :mountain_instructors
  has_many :instructors, through: :mountain_instructors
  has_many :bookings, through: :mountain_instructors
end

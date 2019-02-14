class Review < ApplicationRecord
  belongs_to :student
  belongs_to :instructor
  belongs_to :mountain

  validates :rating, :description, :title, presence: true


end

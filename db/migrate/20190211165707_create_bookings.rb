class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :student_id
      t.integer :mountain_instructor_id
      t.integer :duration
      t.datetime :book_time

      t.timestamps
    end
  end
end

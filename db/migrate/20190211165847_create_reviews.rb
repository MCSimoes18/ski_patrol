class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :instructor_id
      t.integer :student_id
      t.integer :rating
      t.string :description


      t.timestamps
    end
  end
end

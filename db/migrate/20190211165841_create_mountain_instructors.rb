class CreateMountainInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :mountain_instructors do |t|
      t.integer :mountain_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end

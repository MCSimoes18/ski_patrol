class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.integer :experience
      t.integer :rate
      t.string :img

      t.timestamps
    end
  end
end

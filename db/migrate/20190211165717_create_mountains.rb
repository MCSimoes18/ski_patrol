class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :location
      t.integer :trails
      t.integer :lifts

      t.timestamps
    end
  end
end

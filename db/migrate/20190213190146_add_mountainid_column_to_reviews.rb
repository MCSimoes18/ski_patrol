class AddMountainidColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :mountain_id, :integer
  end
end

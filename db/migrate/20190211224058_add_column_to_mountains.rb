class AddColumnToMountains < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :mt_img, :string
  end
end

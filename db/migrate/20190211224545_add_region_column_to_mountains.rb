class AddRegionColumnToMountains < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :region, :string
  end
end

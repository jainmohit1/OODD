class RemoveImageHouses < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :image
  end
end

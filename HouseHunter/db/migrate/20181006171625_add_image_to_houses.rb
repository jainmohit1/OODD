class AddImageToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :image, :string
  end
end

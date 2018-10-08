class AddImagesToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :images, :json
  end
end

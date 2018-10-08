class ChangePriceList2BBigFloatInHouses < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :price_list, :float, limit: 8
  end
end

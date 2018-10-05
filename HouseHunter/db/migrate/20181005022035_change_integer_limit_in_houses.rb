class ChangeIntegerLimitInHouses < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :id, :integer, limit: 8
    change_column :houses, :company_id, :integer, limit: 8
    change_column :houses, :square_footage, :integer, limit: 8
    change_column :houses, :year_built, :integer, limit: 8
    change_column :houses, :number_of_floors, :integer, limit: 8
    change_column :houses, :user_id, :integer, limit: 8
  end
end

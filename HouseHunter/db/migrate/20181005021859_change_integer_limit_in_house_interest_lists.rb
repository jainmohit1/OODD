class ChangeIntegerLimitInHouseInterestLists < ActiveRecord::Migration[5.2]
  def change
    change_column :house_interest_lists, :id, :integer, limit: 8
    change_column :house_interest_lists, :user_id, :integer, limit: 8
    change_column :house_interest_lists, :house_id, :integer, limit: 8
    change_column :house_interest_lists, :company_id, :integer, limit: 8
  end
end

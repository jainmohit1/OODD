class ChangeIntegerLimitInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :id, :integer, limit: 8
    change_column :users, :phone_number, :integer, limit: 8
  end
end

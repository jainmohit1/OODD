class ChangeIntegerLimitInCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :id, :integer, limit: 8
    change_column :companies, :size, :integer, limit: 8
  end
end

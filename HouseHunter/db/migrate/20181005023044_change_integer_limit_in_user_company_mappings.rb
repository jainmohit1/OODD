class ChangeIntegerLimitInUserCompanyMappings < ActiveRecord::Migration[5.2]
  def change
    change_column :user_company_mappings, :id, :integer, limit: 8
    change_column :user_company_mappings, :user_id, :integer, limit: 8
    change_column :user_company_mappings, :company_id, :integer, limit: 8


  end
end

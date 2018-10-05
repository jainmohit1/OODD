class ChangeIntegerLimitInInquiries < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiries, :id, :integer, limit: 8
    change_column :inquiries, :user_id, :integer, limit: 8
    change_column :inquiries, :company_id, :integer, limit: 8
    change_column :inquiries, :house_id, :integer, limit: 8
  end
end

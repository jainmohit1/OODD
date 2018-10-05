class ChangeIntegerLimitInInquiryReplies < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiry_replies, :id, :integer, limit: 8
    change_column :inquiry_replies, :user_id, :integer, limit: 8
    change_column :inquiry_replies, :house_id, :integer, limit: 8
    change_column :inquiry_replies, :inquiry_id, :integer, limit: 8
    change_column :inquiry_replies, :company_id, :integer, limit: 8
  end
end

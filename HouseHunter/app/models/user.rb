class User < ApplicationRecord
  has_many :user_company_mappings, :autosave => true, dependent: :delete_all
  has_many :inquiries ,dependent: :delete_all
  has_many :inquiry_replies , dependent: :delete_all
  has_many :house_interest_lists, dependent: :delete_all
  has_secure_password
  
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true
  
  validates :email_address, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :preferred_contact_method, presence: true, inclusion: {in: %w(email text phone),
                                                                   message: "%{value} is not a valid preferred contact method"}
  validates :phone_number, presence: true, length: { is: 10,
                                                     too_long: "%{count} digits maximum allowed" }
  
  validates :role_type,presence: true, inclusion: { in: %w(admin buyer realtor),
                                                    message: "%{value} is not a valid role type" }
end
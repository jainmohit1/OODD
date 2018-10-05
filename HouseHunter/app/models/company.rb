class Company < ApplicationRecord
  has_many :houses ,dependent: :delete_all
  has_many :user_company_mappings, :autosave => true, dependent: :delete_all
  has_many :inquiries,dependent: :delete_all
  has_many :inquiry_replies, dependent: :delete_all
  has_many :house_interest_lists, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :website, presence: true
  validates :address, presence: true
  validates :founded, presence: true
  validates :size, presence: true
end

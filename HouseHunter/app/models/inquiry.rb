class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :house
  has_many :inquiry_replies, dependent: :delete_all
end

class House < ApplicationRecord
  attr_accessor :image
  belongs_to :company
  has_many :inquiries, dependent: :delete_all
  has_many :inquiry_replies, dependent: :delete_all
  has_many :house_interest_lists, dependent: :delete_all
  mount_uploader :image, ImageUploader
  validates :location, presence: true
  validates :square_footage, presence: true
  validates :year_built, presence: true
  validates :price_list, presence: true
  validates :number_of_floors, presence: true
  
  validates :current_owner, presence: true
  validates :contact_info_realtor, presence: true
end
